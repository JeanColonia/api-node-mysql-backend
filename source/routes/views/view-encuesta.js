const express = require("express");

const router = express.Router();

const mysqlConnection = require("../../db");

router.get("/api/view/encuestas", (req, res) => {
  const query = `SELECT e.idENCUESTA as id, e.codigo_encuesta as codigo, e.nombre_encuesta as nombre, 
    e.descripcion_encuesta as descripcion, e.fecha_encuesta as fecha, s.nombre_servicio as servicio, 
    est.nombre_estadoencuesta as estado, p.nombre_periodo periodo,
    t.nombre_tipoencuesta tipo_encuesta from encuesta as e 
    inner join servicio as s on s.idservicio=e.servicio_idservicio inner join
    estado_encuesta as est on est.idestado_encuesta=e.estado_encuesta_idestado_encuesta 
    inner join periodo as p on p.idperiodo=e.periodo_idperiodo inner join
    tipo_encuesta as t on t.idtipo_encuesta=e.tipo_encuesta_idtipo_encuesta
    ORDER BY idENCUESTA;`;

  mysqlConnection.query(query, (err, rows, fields) => {
    if (!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });
});


router.get("/api/view/encuestas/:id",(req, res)=>{

    const {id}=req.params;

    const query=`SELECT e.idENCUESTA as id, e.codigo_encuesta as codigo, e.nombre_encuesta as nombre, 
    e.descripcion_encuesta as descripcion, e.fecha_encuesta as fecha, s.nombre_servicio as servicio, 
    est.nombre_estadoencuesta as estado, p.nombre_periodo periodo,
    t.nombre_tipoencuesta tipo_encuesta from encuesta as e 
    inner join servicio as s on s.idservicio=e.servicio_idservicio inner join
    estado_encuesta as est on est.idestado_encuesta=e.estado_encuesta_idestado_encuesta 
    inner join periodo as p on p.idperiodo=e.periodo_idperiodo inner join
    tipo_encuesta as t on t.idtipo_encuesta=e.tipo_encuesta_idtipo_encuesta
    where e.idENCUESTA=?;`;

    mysqlConnection.query(query,[id], (err, rows, fields)=>{

            if(!err){
                res.json(rows);
            }
            else{
                console.log(err);
            }
    });
});



module.exports=router;