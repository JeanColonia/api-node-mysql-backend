/**
 * 
 * 
 URL: LOCALHOST:4000/API/SERVICIOS/ENCUESTAS -> DEV
*/

const express = require("express");

const router = express.Router();
const mysqlConnection = require("../db");

router.get("/api/encuestas", (req, res) => {
  const query = `SELECT * FROM ENCUESTA`;
  mysqlConnection.query(query, (err, rows, fields) => {
    if (!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });
});

//GET

/**
 * 
 * 
 URL: LOCALHOST:4000/API/ENCUESTAS/id

 id--> params from req.body

*/

router.get("/api/encuestas/:id", (req, res) => {
  const { id } = req.params;
  const query = `SELECT * FROM ENCUESTA WHERE idENCUESTA=?`;
  mysqlConnection.query(query, [id], (err, rows, fields) => {
    if (!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });
});

router.post("/api/encuestas/add", (req, res) => {
  const query = `INSERT INTO ENCUESTA SET ?`;

  mysqlConnection.query(query, req.body, (err, result) => {
    err
      ? console.log(err)
      : res.status(201).send("Encuesta Agregada Correctamente!");
  });
});

router.put("/api/encuestas/:id", (req, res) => {
  const { id } = req.params;

  const query = `UPDATE ENCUESTA SET ? WHERE idENCUESTA=?`;
  mysqlConnection.query(query, [req.body, id], (err, result) => {
    err ? console.log(err) : res.send("Encuesta Actualizada Correctamente!");
  });
});

router.delete("/api/encuestas/:id", (req, res) => {
  const { id } = req.params;
  mysqlConnection.query(
    "DELETE FROM ENCUESTA WHERE idENCUESTA=?",
    [id],
    (err, rows, fields) => {
      if (!err) {
        res.json({ Status: "Encuesta Eliminada" });
      } else {
        console.log(err);
      }
    }
  );
});

module.exports = router;

/**************************** MODE 2 ***************************************************
----------------------------------------POSTULANTES POST WITH STORE PROCEDURE---------------------- 

//POST

router.post("/api/servicios/encuestas/add", (req, res) => {
    const {idENCUESTA,codigo_encuesta, nombre_encuesta,descripcion_encuesta,
    fecha_encuesta,SERVICIO_idSERVICIO,ESTADO_ENCUESTA_idESTADO_ENCUESTA,PERIODO_idPERIODO,TIPO_ENCUESTA_idTIPO_ENCUESTA}=req.body;
      
    const query=`
    SET @id=?;
    SET @codigo=?;
    SET @nombre=?;
    SET @descripcion=?;
    SET @fecha=?;
    SET @servicio=?;
    SET @estado=?;
    SET @periodo=?;
    SET @tipo_encuesta=?;
        CALL SP_ENCUESTA(@id, @codigo, @nombre, @descripcion, @fecha, @servicio, @estado, @periodo, @tipo_encuesta)
        `;
    mysqlConnection.query(query, [idENCUESTA,codigo_encuesta,nombre_encuesta,descripcion_encuesta,fecha_encuesta,SERVICIO_idSERVICIO,ESTADO_ENCUESTA_idESTADO_ENCUESTA,PERIODO_idPERIODO,TIPO_ENCUESTA_idTIPO_ENCUESTA], (err, rows, fields)=>{
        if(!err){
            res.json({Status: "Encuesta registrada"});
            
        }
        else{
            console.log(err);
        }
    });
});




/*
STORE PROCEDURE SP_ENCUESTA DETAILS
-------->  CASE INSERT:
{
    idENCUESTA: 0 --> Determina que se va a registrar.
}

-------->  CASE UPDATE:
 
{
    No se pone el idPOSTULANTE, ya que jala del req.params para su actualización.
}
 


router.put("/api/servicios/encuestas/:id",(req, res)=>{
  const {codigo_encuesta, nombre_encuesta,descripcion_encuesta,
    fecha_encuesta,SERVICIO_idSERVICIO,ESTADO_ENCUESTA_idESTADO_ENCUESTA,PERIODO_idPERIODO,TIPO_ENCUESTA_idTIPO_ENCUESTA}=req.body;
    
    const {id}=req.params;

    const query=`
    SET @id=?;
    SET @codigo=?;
    SET @nombre=?;
    SET @descripcion=?;
    SET @fecha=?;
    SET @servicio=?;
    SET @estado=?;
    SET @periodo=?;
    SET @tipo_encuesta=?;
        CALL SP_ENCUESTA(@id, @codigo, @nombre, @descripcion, @fecha, @servicio, @estado, @periodo, @tipo_encuesta)
        `;
    mysqlConnection.query(query,[id,codigo_encuesta,nombre_encuesta,descripcion_encuesta,fecha_encuesta,SERVICIO_idSERVICIO,ESTADO_ENCUESTA_idESTADO_ENCUESTA,PERIODO_idPERIODO,TIPO_ENCUESTA_idTIPO_ENCUESTA],(err, rows, fields)=>{

      if(!err){
        res.json({Status:"Encuesta actualizada!"});
      }

      else{
        console.log(err);
      }
    });
});
*/
