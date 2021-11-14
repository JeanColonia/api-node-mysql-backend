const express = require("express");

const router = express.Router();

const mysqlConnection = require("../db");

router.get("/api/postulantes", (req, res) => {
  const query = `SELECT * FROM POSTULANTE`;
  mysqlConnection.query(query, (err, rows, fields) => {
    if (!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });
});

router.get("/api/postulantes/:id", (req, res) => {
  const { id } = req.params;
  const query = `SELECT * FROM POSTULANTE WHERE idPOSTULANTE=?`;
  mysqlConnection.query(query, [id], (err, rows, fields) => {
    if (!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });
});

router.post("/api/postulantes/add", (req, res) => {
  const query = `INSERT INTO POSTULANTE SET ?`;
  mysqlConnection.query(query, req.body, (err, result) => {
    err
      ? console.log(err)
      : res.status(201).send("Postulante Agregado Correctamente!");
  });
});

router.put("/api/postulantes/:id", (req, res) => {
  const { id } = req.params;
  const query = `UPDATE POSTULANTE SET ? WHERE idPOSTULANTE=?`;
  mysqlConnection.query(query, [req.body, id], (err, result) => {
    err ? console.log(err) : res.send("Postulante Actualizado Correctamente!");
  });
});

router.delete("/api/postulantes/:id", (req, res) => {
  const { id } = req.params;
  mysqlConnection.query(
    `DELETE FROM POSTULANTE WHERE idPOSTULANTE=${id}`,
    (err, rows, fields) => {
      if (!err) {
        res.json({ Status: "Postulante Eliminado!" });
      } else {
        console.log(err);
      }
    }
  );
});

module.exports = router;

/* **************************** MODE 2 ***************************************************
----------------------------------------POSTULANTES POST WITH STORE PROCEDURE---------------------- 
router.post("/api/postulantes/add", (req, res)=>{
        
    const query=`
    SET @id=?;
    SET @codigo=?;
    SET @nombres=?;
    SET @apellido_paterno=?;
    SET @apellido_materno=?;
    SET @celular=?;
    SET @direccion=?;
    SET @edad=?;
    SET @fecha_nacimiento=?;
    SET @estado=?;
    SET @idescuela=?;
    SET @idlocalidad=?;
    CALL SP_POSTULANTE(@id, @codigo, @nombres, @apellido_paterno, @apellido_materno,@celular, @direccion, @edad, @fecha_nacimiento, @estado, @idescuela, @idlocalidad);
    `;
    mysqlConnection.query(query,[idPOSTULANTE,codigo,nombres,apellido_paterno,apellido_materno,celular,direccion,edad,fecha_nacimiento,estado,ESCUELA_idESCUELA,LOCALIDAD_idLOCALIDAD],(err,rows,fields)=>{

        if(!err){
            res.json({Status:"Postulante registrado"});
        }
        else{
            console.log(err);
        }
    });

});



/*
============================STORE PROCEDURE SP_POSTULANTE DETAILS======================================
-------->  CASE INSERT:
{
    idPOSTULANTE: 0 --> Determina que se va a registrar.
}

-------->  CASE UPDATE:
 
{
    No se pone el idPOSTULANTE, ya que jala del req.params para su actualización.
}
 

==================== PUT =====================================================
router.put("/api/postulantes/:id",(req, res)=>{
    const {codigo, nombres,apellido_paterno,apellido_materno,celular,direccion,edad,fecha_nacimiento,estado,ESCUELA_idESCUELA,LOCALIDAD_idLOCALIDAD}=req.body;
    const {id}=req.params;

    const query=`
    SET @id=?;
    SET @codigo=?;
    SET @nombres=?;
    SET @apellido_paterno=?;
    SET @apellido_materno=?;
    SET @celular=?;
    SET @direccion=?;
    SET @edad=?;
    SET @fecha_nacimiento=?;
    SET @estado=?;
    SET @idescuela=?;
    SET @idlocalidad=?;
    CALL SP_POSTULANTE(@id, @codigo, @nombres, @apellido_paterno, @apellido_materno,@celular, @direccion, @edad, @fecha_nacimiento, @estado, @idescuela, @idlocalidad);
    `;

    mysqlConnection.query(query,[id,codigo,nombres,apellido_paterno,apellido_materno,celular,direccion,edad,fecha_nacimiento,estado,ESCUELA_idESCUELA,LOCALIDAD_idLOCALIDAD],(err, rows, fields)=>{
        if(!err){
            res.json({Status:"Postulante actualizado"});
        }
        else{
            console.log(err);
        }
    });

});


*/

/* 
DB SP_POSTULANTE CODE FOR MORE INFORMATION

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_POSTULANTE`(
IN _id INT,
IN _codigo VARCHAR(45),
IN _nombres VARCHAR(45),
IN _apellido_paterno VARCHAR(45),
IN _apellido_materno VARCHAR(45),
IN _celular VARCHAR(45),
IN _direccion VARCHAR(45),
IN _edad VARCHAR(45),
IN _fecha_nacimiento VARCHAR(45),
IN _estado VARCHAR(45),
IN id_escuela INT,
IN id_localidad INT
)
BEGIN
	IF _id=0 THEN
    INSERT INTO postulante(codigo, nombres, apellido_paterno, apellido_materno, celular, direccion, edad, fecha_nacimiento, estado, ESCUELA_idESCUELA, LOCALIDAD_idLOCALIDAD)
    VALUES(_codigo, _nombres, _apellido_paterno, _apellido_materno,_celular,_direccion,_edad,_fecha_nacimiento,_estado,id_escuela,id_localidad);
    
    SET _id=LAST_INSERT_ID();
    
ELSE 
UPDATE postulante
	SET
		codigo=_codigo,
        nombres=_nombres,
        apellido_paterno=_apellido_paterno,
        apellido_materno=_apellido_materno,
        celular=_celular,
        direccion=_direccion,
        edad=_edad,
        fecha_nacimiento=_fecha_nacimiento,
        estado=_estado, 
        ESCUELA_idESCUELA=id_escuela,
        LOCALIDAD_idLOCALIDAD=id_localidad
        WHERE idPOSTULANTE=_id;
        
        END IF;
        SELECT _id as idPOSTULANTE;
END

*/
