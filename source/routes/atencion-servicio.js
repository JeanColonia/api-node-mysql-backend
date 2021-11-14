const express = require("express");

const router = express.Router();

const mysqlConnection = require("../db");
const { get } = require("./organizacion-a-cargo");

router.get("/api/atencion-servicio", (req, res) => {
  const query = `SELECT * FROM ATENCION_SERVICIO`;

  mysqlConnection.query(query, (err, result) => {
    err ? console.log(err) : res.send(result);
  });
});


router.get('/api/atencion-servicio/:id', (req, res)=>{

    const {id}=req.params;
    const query=`SELECT * FROM ATENCION_SERVICIO WHERE idATENCION_SERVICIO=?`;

    mysqlConnection.query(query,id, (err, result)=>{

        err ? console.log(err) : res.send(result);

    });
});


router.post('/api/atencion-servicio/add', (req, res)=>{
    
    const query=`INSERT INTO ATENCION_SERVICIO SET ?`;

    mysqlConnection.query(query, req.body, (err, result)=>{
    
        err ? console.log(err) : res.status(201).send('La atención del servicio fue creado correctamente!');
    });
});

router.put('/api/atencion-servicio/:id', (req, res)=>{
    
    const {id} = req.params;
    const query=`UPDATE ATENCION_SERVICIO SET ?  WHERE idATENCION_SERVICIO=?`;

    mysqlConnection.query(query, [req.body, id], (err, result)=>{
        err ? console.log(err) : res.send('Atención del Servicio Actualizada correctamente!');
    });

});


router.delete('/api/atencion-servicio/:id', (req, res)=>{

    const {id}=req.params;
    const query=`DELETE FROM ATENCION_SERVICIO WHERE idATENCION_SERVICIO=?`;
    mysqlConnection.query(query, id, (err, result)=>{
        err ? console.log(err) : res.send('Atención del Servicio Eliminada correctamente!');
    });
});


module.exports = router;
