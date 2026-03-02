const express = require('express');
const mysql = require('mysql2');
const multer = require('multer');
const {parse} = require('csv-parse');
const fs = require('fs');
const { error } = require('console');
const app = express();



const upload = multer({dest: 'uploads/'});

app.use(express.json());

const conection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'password',
    database: 'tortuga'
});

conection.connect((err) =>{
    if (err){
        console.log('error en la conexión:', err);
    }
    else{
        console.log('conexion correcta');
    }
});

/*
app.get('/productos', (req,res)=>{
    conection.query('SELECT * FROM productos',(err,result)=>{
    if(err){
    res.status(500).json({ error: 'Error al consultar la base de datos' })
    }
    else{
    res.json(result)
    }
    });
});
*/
/*

// EMPRESAS // DONE

app.post('/empresas', upload.single('archivo'),(req,res)=>{
    const rows =[];
    fs.createReadStream(req.file.path)
    .pipe(parse({columns: true}))
    .on('data',row => rows.push(row))
    .on('end', ()=>{
        const valores = rows.map(row=>[ row.id_empresa , row.nombre, row.ubicacion])
        conection.query('INSERT INTO empresas (id_empresa, nombre, ubicacion) VALUES ?', [valores], (err,result)=>{
            if(err){
                console.log('el error es', err)
                res.status(500).json({ error: 'Error al consultar la base de datos'})
            }
            else{
                res.json(result)
            }
        })
    })
})
*/

// EMPLEADOS // DONE

/*
app.post('/empleados', upload.single('archivo'),(req,res)=>{
    const rows =[];
    fs.createReadStream(req.file.path)
    .pipe(parse({columns: true}))
    .on('data',row => rows.push(row))
    .on('end', ()=>{
        const valores = rows.map(row=>[ row.id_empleado , row.nombre, row.email, row.id_empresa])
        conection.query('INSERT INTO empleados (id_empleado, nombre, email, id_empresa) VALUES ?', [valores], (err,result)=>{
            if(err){
                console.log('el error es', err)
                res.status(500).json({ error: 'Error al consultar la base de datos'})
            }
            else{
                res.json(result)
            }
        })
    })
})
*/

// CLIENTES // DONE

/*
app.post('/clientes', upload.single('archivo'),(req,res)=>{
    const rows =[];
    fs.createReadStream(req.file.path)
    .pipe(parse({columns: true}))
    .on('data',row => rows.push(row))
    .on('end', ()=>{
        const valores = rows.map(row=>[ row.cliente , row.nombre, row.email])
        conection.query('INSERT INTO clientes (id_cliente, nombre, email) VALUES ?', [valores], (err,result)=>{
            if(err){
                console.log('el error es', err)
                res.status(500).json({ error: 'Error al consultar la base de datos'})
            }
            else{
                res.json(result)
            }
        })
    })
})
*/

// CONTRATOS // DONE

/*
app.post('/contratos', upload.single('archivo'),(req,res)=>{
    const rows =[];
    fs.createReadStream(req.file.path)
    .pipe(parse({columns: true}))
    .on('data',row => rows.push(row))
    .on('end', ()=>{
        const valores = rows.map(row=>[ row.id_contrato , row.pago_total, row.id_empresa, row.id_cliente])
        conection.query('INSERT INTO contratos (id_contrato, pago_total, id_empresa, id_cliente) VALUES ?', [valores], (err,result)=>{
            if(err){
                console.log('el error es', err)
                res.status(500).json({ error: 'Error al consultar la base de datos'})
            }
            else{
                res.json(result)
            }
        })
    })
})
*/

// SERVICIOS // DONE

/*
app.post('/servicios', upload.single('archivo'),(req,res)=>{
    const rows =[];
    fs.createReadStream(req.file.path)
    .pipe(parse({columns: true}))
    .on('data',row => rows.push(row))
    .on('end', ()=>{
        const valores = rows.map(row=>[ row.id_servicio , row.nombre])
        conection.query('INSERT INTO servicios (id_servicio, nombre ) VALUES ?', [valores], (err,result)=>{
            if(err){
                console.log('el error es', err)
                res.status(500).json({ error: 'Error al consultar la base de datos'})
            }
            else{
                res.json(result)
            }
        })
    })
})
*/

// CONTRATO_SERVICIOS // DONE

/*
app.post('/contrato_servicios', upload.single('archivo'),(req,res)=>{
    const rows =[];
    fs.createReadStream(req.file.path)
    .pipe(parse({columns: true}))
    .on('data',row => rows.push(row))
    .on('end', ()=>{
        const valores = rows.map(row=>[ row.id_contrato , row.id_servicio])
        conection.query('INSERT INTO contrato_servicio (id_contrato, id_servicio) VALUES ?', [valores], (err,result)=>{
            if(err){
                console.log('el error es', err)
                res.status(500).json({ error: 'Error al consultar la base de datos'})
            }
            else{
                res.json(result)
            }
        })
    })
})
*/



app.listen(3000, ()=>{
    console.log('servidor abierto en http://localhost:3000');
});

--------------------------------------------------------    

🐳 1️⃣ Verificar que Docker esté instalado

En tu terminal:

docker --version

Si responde con una versión → ✅ listo
Si no → debes instalar Docker Desktop primero.

🐬 2️⃣ Crear el contenedor MySQL

Ejecuta esto:

docker run --name mysql-server \
-p 3306:3306 \
-e MYSQL_ROOT_PASSWORD=123456 \
-e MYSQL_DATABASE=mi_base \
-d mysql:8.0
🔎 Qué significa:

--name mysql-server → nombre del contenedor

-p 3306:3306 → expone el puerto 3306

MYSQL_ROOT_PASSWORD=123456 → contraseña root

MYSQL_DATABASE=mi_base → crea una base automáticamente

-d → modo background

mysql:8.0 → imagen oficial

📦 3️⃣ Verificar que el contenedor esté corriendo
docker ps

Debe aparecer algo como:

mysql-server   mysql:8.0   Up ...
🛠 4️⃣ Conectarte desde la terminal (opcional)
docker exec -it mysql-server mysql -u root -p

Te pedirá la contraseña (123456).

🗄 5️⃣ Conectarlo desde DBeaver o MySQL Workbench
Parámetros:

Host: localhost

Puerto: 3306

Usuario: root

Password: 123456

Base de datos: mi_base

🟢 6️⃣ Conectarlo desde Node.js (Express)

Instala mysql2:

npm install mysql2

Luego en tu código:

const mysql = require('mysql2');

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '123456',
  database: 'mi_base'
});

connection.connect(err => {
  if (err) {
    console.log('Error de conexión:', err);
  } else {
    console.log('Conectado a MySQL 🚀');
  }
});
💾 OPCIONAL (Recomendado) — Persistencia de datos

Si quieres que los datos no se borren cuando elimines el contenedor:

docker run --name mysql-server \
-p 3306:3306 \
-e MYSQL_ROOT_PASSWORD=123456 \
-e MYSQL_DATABASE=mi_base \
-v mysql_data:/var/lib/mysql \
-d mysql:8.0

Esto crea un volumen llamado mysql_data.

🧠 Comandos útiles

Detener:

docker stop mysql-server

Iniciar:

docker start mysql-server

Eliminar:

docker rm -f mysql-server
🚀 Flujo profesional recomendado

Crear contenedor con volumen

Conectarlo desde DBeaver

Crear tablas

Conectarlo desde Express

Usar .env para credenciales

-----------------------------------------

USE tortuga;


CREATE TABLE empresas (
    id_empresa INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(150) NOT NULL
);

CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    id_empresa INT,
    FOREIGN KEY (id_empresa) REFERENCES empresas(id_empresa)
);

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE contratos (
    id_contrato VARCHAR(20) PRIMARY KEY,
    pago_total DECIMAL(10,2) NOT NULL,
    id_empresa INT,
    id_cliente INT,
    FOREIGN KEY (id_empresa) REFERENCES empresas(id_empresa),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE servicios (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE contrato_servicio (
    id_contrato VARCHAR(20),
    id_servicio INT,
    PRIMARY KEY (id_contrato, id_servicio),
    FOREIGN KEY (id_contrato) REFERENCES contratos(id_contrato),
    FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio)
);

--------------------------------------------------

🐳 1️⃣ Descargar y crear el contenedor MongoDB

Ejecuta esto:

docker run --name mongo-server \
-p 27017:27017 \
-e MONGO_INITDB_ROOT_USERNAME=admin \
-e MONGO_INITDB_ROOT_PASSWORD=123456 \
-v mongo_data:/data/db \
-d mongo:latest
🔎 Qué hace cada parte:

--name mongo-server → nombre del contenedor

-p 27017:27017 → puerto de Mongo

MONGO_INITDB_ROOT_USERNAME → usuario

MONGO_INITDB_ROOT_PASSWORD → contraseña

-v mongo_data:/data/db → volumen (no se pierden datos)

-d → modo background

mongo:latest → imagen oficial

📦 2️⃣ Verificar que esté corriendo
docker ps

Debe aparecer algo como:

mongo-server   mongo:latest   Up ...
🖥 3️⃣ Conectarte desde la terminal
docker exec -it mongo-server mongosh -u admin -p 123456

Si entra al shell de Mongo → ✅ todo está bien.

🧠 4️⃣ Crear base de datos manualmente

Dentro de mongosh:

use mi_base
db.createCollection("usuarios")

Mongo crea la base automáticamente cuando insertas algo.

🟢 5️⃣ Conectarlo desde Node.js (sin Mongoose)

Instala el driver oficial:

npm install mongodb


--------------------------

Ahora vamos a hacerlo bien hecho: logs en MongoDB, organizados y profesionales.

Te lo explico paso a paso 👇

🧠 ¿Qué es un log?

Un log es un registro de:

✅ Errores

✅ Conexiones

✅ Acciones del usuario

✅ Consultas a bases de datos

✅ Eventos importantes del sistema

🗂 1️⃣ Estructura recomendada para un log

Un log profesional debería verse así:

{
  "nivel": "info",
  "servicio": "mongo",
  "mensaje": "Conexión exitosa",
  "detalle": "Base mi_base conectada",
  "fecha": "2026-03-01T23:00:00.000Z"
}
🔥 2️⃣ Crear función para guardar logs

Crea un archivo:

logs.js

Dentro pon esto:

const { MongoClient } = require('mongodb');

const uri = "mongodb://admin:123456@localhost:27017/?authSource=admin";

async function guardarLog(nivel, servicio, mensaje, detalle) {
  const client = new MongoClient(uri);

  try {
    await client.connect();

    const db = client.db("tortuga_logs");
    const collection = db.collection("logs");

    await collection.insertOne({
      nivel,
      servicio,
      mensaje,
      detalle,
      fecha: new Date()
    });

  } catch (error) {
    console.error("Error guardando log:", error);
  } finally {
    await client.close();
  }
}

module.exports = guardarLog;
🚀 3️⃣ Usarlo en tu servidor

En tu server.js:

const guardarLog = require('./logs');

Cuando conectes a Mongo:

guardarLog("info", "mongo", "Conexión exitosa", "Mongo conectado correctamente");

Si hay error:

guardarLog("error", "mongo", "Error de conexión", error.message);
🔍 4️⃣ Endpoint para ver logs
app.get('/logs', async (req, res) => {
  const { MongoClient } = require('mongodb');
  const client = new MongoClient(uri);

  try {
    await client.connect();
    const db = client.db("tortuga_logs");

    const logs = await db.collection("logs")
      .find()
      .sort({ fecha: -1 })
      .toArray();

    res.json(logs);

  } catch (error) {
    res.status(500).json({ error: "Error obteniendo logs" });
  } finally {
    await client.close();
  }
});
🧪 5️⃣ Ver logs solo de Mongo
.find({ servicio: "mongo" })
.project({ _id: 0, fecha: 1, mensaje: 1 })

-------------------------------------------------

🧠 ¿Qué es una Vista en MySQL?

Una vista es como una tabla virtual.

👉 No guarda datos físicamente
👉 Guarda una consulta (SELECT)
👉 Cada vez que la consultas, ejecuta esa consulta

Es como decir:

“Guárdame este SELECT con un nombre”

📌 Sintaxis básica
CREATE VIEW nombre_vista AS
SELECT columnas
FROM tabla
WHERE condición;
🔥 Ejemplo real

Supongamos que tienes esta tabla:

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    edad INT,
    ciudad VARCHAR(100)
);
🎯 Crear vista de usuarios mayores de edad
CREATE VIEW view_usuarios_adultos AS
SELECT id, nombre, ciudad
FROM usuarios
WHERE edad >= 18;
🚀 ¿Cómo usar la vista?

Como si fuera una tabla normal:

SELECT * FROM view_usuarios_adultos;
🧩 Ejemplo más avanzado (con JOIN)

Supongamos que tienes:

usuarios
pedidos

Quieres una vista con el nombre del usuario y su total de pedidos:

CREATE VIEW view_resumen_pedidos AS
SELECT 
    u.nombre,
    COUNT(p.id) AS total_pedidos
FROM usuarios u
JOIN pedidos p ON u.id = p.usuario_id
GROUP BY u.nombre;

Ahora consultas:

SELECT * FROM view_resumen_pedidos;
🛠 Ver vistas existentes
SHOW FULL TABLES WHERE TABLE_TYPE = 'VIEW';
✏️ Modificar una vista
CREATE OR REPLACE VIEW view_usuarios_adultos AS
SELECT id, nombre
FROM usuarios
WHERE edad >= 21;
❌ Eliminar una vista
DROP VIEW view_usuarios_adultos;
🧠 ¿Cuándo usar vistas?

✅ Simplificar consultas complejas
✅ Ocultar columnas sensibles
✅ Crear reportes
✅ Dar acceso limitado a usuarios

🎯 Ejemplo profesional (como los que tú haces)

Si quieres crear una vista tipo:

CREATE VIEW view_user_contacts AS
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name,
    email,
    COALESCE(mobile, phone, 'Sin teléfono') AS contact_number,
    address,
    city,
    state,
    country
FROM users;

Eso es una vista bien hecha 🔥

🏆 Bonus técnico

Las vistas:

No mejoran rendimiento (no almacenan datos)

Siempre ejecutan el SELECT original

Para rendimiento real → usar índices o tablas materializadas (no existen nativamente en MySQL)
