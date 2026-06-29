const express = require('express');
const mysql = require('mysql2/promise');
const cors = require('cors');
const path = require('path');

const app = express();
app.use(cors());
app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));

const dbConfig = {
  host: process.env.DB_HOST || 'mysql',
  user: process.env.DB_USER || 'root',
  password: process.env.DB_PASSWORD || 'root1234',
  database: process.env.DB_NAME || 'tf_bd',
  waitForConnections: true,
  connectionLimit: 10,
};

let pool;
async function getPool() {
  if (!pool) pool = mysql.createPool(dbConfig);
  return pool;
}

// ── Ciudadanos ───────────────────────────────────────────────
app.get('/api/ciudadanos', async (req, res) => {
  try {
    const db = await getPool();
    const [rows] = await db.query(`
      SELECT id_ciudadano, ci, credencial_civica, nombre_completo,
             fecha_nacimiento, tiene_credencial
      FROM CIUDADANO
      ORDER BY nombre_completo
    `);
    res.json(rows);
  } catch (e) { res.status(500).json({ error: e.message }); }
});

// ── Elecciones y participación ───────────────────────────────
app.get('/api/elecciones', async (req, res) => {
  try {
    const db = await getPool();
    const [rows] = await db.query(`
      SELECT e.id_eleccion, e.nombre AS eleccion, e.fecha, e.estado,
             te.nombre AS tipo,
             COUNT(pe.id_participacion) AS total_participaciones
      FROM ELECCION e
      JOIN TIPO_ELECCION te ON e.id_tipo_eleccion = te.id_tipo_eleccion
      LEFT JOIN PARTICIPACION_ELECTORAL pe ON e.id_eleccion = pe.id_eleccion
      GROUP BY e.id_eleccion
      ORDER BY e.fecha DESC
    `);
    res.json(rows);
  } catch (e) { res.status(500).json({ error: e.message }); }
});

// ── Votos por partido ────────────────────────────────────────
app.get('/api/votos-partido', async (req, res) => {
  try {
    const db = await getPool();
    const [rows] = await db.query(`
      SELECT p.nombre AS partido,
             e.nombre AS eleccion,
             COUNT(dv.id_voto) AS total_votos
      FROM DETALLE_VOTO dv
      JOIN PAPELETA pa ON dv.id_papeleta = pa.id_papeleta
      JOIN LISTA l ON pa.id_papeleta = l.id_lista
      JOIN PARTIDO p ON l.id_partido = p.id_partido
      JOIN ELECCION e ON pa.id_eleccion = e.id_eleccion
      JOIN VOTO v ON dv.id_voto = v.id_voto
      WHERE v.estado_voto = 'Válido'
      GROUP BY p.id_partido, e.id_eleccion
      ORDER BY total_votos DESC
    `);
    res.json(rows);
  } catch (e) { res.status(500).json({ error: e.message }); }
});

// ── Mesas y circuitos ────────────────────────────────────────
app.get('/api/mesas', async (req, res) => {
  try {
    const db = await getPool();
    const [rows] = await db.query(`
      SELECT m.id_mesa, m.estado, m.fecha_apertura, m.fecha_cierre,
             c.numero_circuito, c.barrio_zona, c.accesible, c.votos_emitidos,
             est.nombre AS establecimiento,
             e.nombre AS eleccion
      FROM MESA m
      JOIN CIRCUITO c ON m.id_circuito = c.id_circuito
      JOIN ESTABLECIMIENTO est ON c.id_establecimiento = est.id_establecimiento
      JOIN ELECCION e ON m.id_eleccion = e.id_eleccion
      ORDER BY c.numero_circuito
    `);
    res.json(rows);
  } catch (e) { res.status(500).json({ error: e.message }); }
});

// ── Candidatos y listas ──────────────────────────────────────
app.get('/api/candidatos', async (req, res) => {
  try {
    const db = await getPool();
    const [rows] = await db.query(`
      SELECT c.nombre_completo AS candidato,
             p.nombre AS partido,
             l.numero_lista,
             il.orden_aparicion,
             e.nombre AS eleccion
      FROM INTEGRACION_LISTA il
      JOIN CANDIDATO c ON il.id_candidato = c.id_candidato
      JOIN LISTA l ON il.id_lista = l.id_lista
      JOIN PARTIDO p ON l.id_partido = p.id_partido
      JOIN PAPELETA pa ON l.id_lista = pa.id_papeleta
      JOIN ELECCION e ON pa.id_eleccion = e.id_eleccion
      ORDER BY e.nombre, l.numero_lista, il.orden_aparicion
    `);
    res.json(rows);
  } catch (e) { res.status(500).json({ error: e.message }); }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`API corriendo en http://localhost:${PORT}`));