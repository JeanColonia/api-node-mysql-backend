const express = require("express");

const router = express.Router();
const mysqlConnection = require("../db");

router.get("/api/servicios", (req, res) => {
  const query = "SELECT * FROM SERVICIO";

  mysqlConnection.query(query, (err, rows, fields) => {
    if (!err) {
      console.log(res.json(rows));
    } else {
      console.log(err);
    }
  });
});

router.get("/api/servicios/:id", (req, res) => {
  const { id } = req.params;

  const query = `SELECT * FROM SERVICIO WHERE idSERVICIO=?`;

  mysqlConnection.query(query, [id], (err, rows, fields) => {
    if (!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });
});

router.post("/api/servicios/add", (req, res) => {
  const {
    idSERVICIO, nombre_servicio, descripcion, INSTITUCION_idINSTITUCION,
    SEMESTRE_idSEMESTRE, ESTADO_idESTADO, ORGANIZACION_A_CARGO_codigo_organizacion,
    TIPO_SERVICIO_idTIPO_SERVICIO,fecha_creacion_servicio} = req.body;

  const query = `
  SET @id=?;
  SET @nombre=?;
  SET @descripcion=?;
  SET @institucion=?;
  SET @semestre=?;
  SET @estado=?;
  SET @organizacion=?;
  SET @tipo_servicio=?;
  SET @fecha=?;
  
  CALL SP_SERVICIO(@id, @nombre, @descripcion, @institucion, @semestre, @estado, @organizacion, @tipo_servicio, @fecha);
  `;

  mysqlConnection.query(
    query,
    [idSERVICIO,nombre_servicio,descripcion,INSTITUCION_idINSTITUCION,SEMESTRE_idSEMESTRE,ESTADO_idESTADO,ORGANIZACION_A_CARGO_codigo_organizacion,TIPO_SERVICIO_idTIPO_SERVICIO,fecha_creacion_servicio],
    (err, rows, fields) => {
      if (!err) {
        res.json({ Status: "Servicio Registrado!" });
      } else {
        console.log(err);
      }
    }
  );
});

router.put("/api/servicios/:id", (req, res) => {
  const { id } = req.params;
  const {
    nombre_servicio,
    descripcion,
    INSTITUCION_idINSTITUCION,
    SEMESTRE_idSEMESTRE,
    ESTADO_idESTADO,
    ORGANIZACION_A_CARGO_codigo_organizacion,
    TIPO_SERVICIO_idTIPO_SERVICIO,
    fecha_creacion_servicio,
  } = req.body;

  const query = `
  SET @id=?;
  SET @nombre=?;
  SET @descripcion=?;
  SET @institucion=?;
  SET @semestre=?;
  SET @estado=?;
  SET @organizacion=?;
  SET @tipo_servicio=?;
  SET @fecha=?;
  
  CALL SP_SERVICIO(@id, @nombre, @descripcion, @institucion, @semestre, @estado, @organizacion, @tipo_servicio, @fecha);
  `;
  mysqlConnection.query(
    query,
    [id,nombre_servicio,descripcion,INSTITUCION_idINSTITUCION,SEMESTRE_idSEMESTRE,ESTADO_idESTADO,ORGANIZACION_A_CARGO_codigo_organizacion,TIPO_SERVICIO_idTIPO_SERVICIO,fecha_creacion_servicio],
    (err, rows, fields) => {
      if (!err) {
        res.json({ Status: "Service Updated!" });
      } else {
        console.log(err);
      }
    }
  );
});

router.delete("/api/servicios/:id", (req, res) => {
      const { id } = req.params;

      const query=`DELETE FROM SERVICIO WHERE idSERVICIO=${id}`;

      mysqlConnection.query(query,[id],(err, rows, fields)=>{

        if(!err){
            res.json({Status:"Service Deleted"});
        }
      });
});

module.exports = router;



/*
STORE PROCEDURE SP_SERVICIO DETAILS
-------->  CASE INSERT:
{
    idSERVICIO: 0 --> Determina que se va a registrar.
}

-------->  CASE UPDATE:
 
{
    No se pone el idPOSTULANTE, ya que jala del req.params para su actualización.
}
 
_____________________________________________________________________________________________________________________

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SERVICIO`(
IN _id INT,
IN _nombre VARCHAR(100),
IN _descripcion VARCHAR(100),
IN _institucion INT,
IN _semestre INT,
IN _estado INT,
IN _organizacion INT,
IN _tipo_servicio INT,
IN _fecha_creacion VARCHAR(45)
)
BEGIN
	
    IF _id=0 THEN
    INSERT INTO SERVICIO(nombre_servicio, descripcion, INSTITUCION_idINSTITUCION, 
    SEMESTRE_idSEMESTRE, ESTADO_idESTADO, ORGANIZACION_A_CARGO_codigo_organizacion,
    TIPO_SERVICIO_idTIPO_SERVICIO, fecha_creacion_servicio)
    VALUES (_nombre, _descripcion, _institucion, _semestre, _estado, _organizacion,
    _tipo_servicio,
    _fecha_creacion);
    
    SET _id=LAST_INSERT_ID();
    
    ELSE
    UPDATE SERVICIO
    SET 
    idSERVICIO=_id,
    nombre_servicio=_nombre,
    descripcion=_descripcion,
    INSTITUCION_idINSTITUCION=_institucion,
    SEMESTRE_idSEMESTRE=_semestre,
    ESTADO_idESTADO=_estado,
    ORGANIZACION_A_CARGO_codigo_organizacion=_organizacion,
    TIPO_SERVICIO_idTIPO_SERVICIO=_tipo_servicio,
    fecha_creacion_servicio=_fecha_creacion
    WHERE idSERVICIO=_id;
    END IF;
    SELECT _id as idSERVICIO;

END
*/



