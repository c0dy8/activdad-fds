// logs.js
const { MongoClient } = require('mongodb');

const url = 'mongodb://localhost:27017';
const client = new MongoClient(url);

let logsCollection;

// Conectar a MongoDB
async function conectarMongo() {
    try {
        await client.connect();
        console.log('MongoDB conectado');

        const db = client.db('tortuga_logs');
        logsCollection = db.collection('logs');

    } catch (error) {
        console.error('Error conectando MongoDB:', error);
    }
}

// Guardar log
async function guardarLog(tipo, mensaje, detalle = null) {
    try {
        if (!logsCollection) return;

        await logsCollection.insertOne({
            tipo,
            mensaje,
            detalle,
            fecha: new Date()
        });

    } catch (error) {
        console.error('Error guardando log:', error);
    }
}

module.exports = {
    conectarMongo,
    guardarLog
};