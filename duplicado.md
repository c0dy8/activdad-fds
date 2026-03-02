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