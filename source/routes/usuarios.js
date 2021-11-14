const { json } = require("express");
const express = require("express");

const router = express.Router();

const mysqlConnection = require("../db");

router.get("/api/usuarios", (req, res) => {
  const query = `SELECT * FROM USUARIO`;

  mysqlConnection.query(query, (err, rows, fields) => {
    if (!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });
});

router.get("/api/usuarios/:id", (req, res) => {
  const { id } = req.params;

  const query = `SELECT * FROM USUARIO WHERE idUSUARIO=?`;

  mysqlConnection.query(query, [id], (err, rows, fields) => {
    if (!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });
});


router.post('/api/usuarios/add',(req,res)=>{
    const {idUSUARIO, email, password, POSTULANTE_idPOSTULANTE, TIPO_USUARIO_idTIPO_USUARIO}=req.body;


    /*
    const query=`INSERT INTO USUARIO(idUSUARIO, email, password, POSTULANTE_idPOSTULANTE, TIPO_USUARIO_idTIPO_USUARIO)
    VALUES(?,?,?,?,?);`;

    */

    const query=`
    SET @id=?;
    SET @email=?;
    SET @pass=?;
    SET @postulante=?;
    SET @tipo_usuario=?;
    CALL SP_USUARIO(@id, @email, @pass, @postulante, @tipo_usuario);
    `;


    mysqlConnection.query(query,[idUSUARIO, email, password, POSTULANTE_idPOSTULANTE, TIPO_USUARIO_idTIPO_USUARIO],(err, rows, fields)=>{
        
        if(!err){
            res.json({Status:"User added!"});
        }

        else{
            console.log(err);
        }
    });
    
});


router.put("/api/usuarios/:id",(req, res)=>{

    const {id}=req.params;
    const {email, password, POSTULANTE_idPOSTULANTE, TIPO_USUARIO_idTIPO_USUARIO}=req.body;

    const query=`
    SET @id=?;
    SET @email=?;
    SET @pass=?;
    SET @postulante=?;
    SET @tipo_usuario=?;
    CALL SP_USUARIO(@id, @email, @pass, @postulante, @tipo_usuario);
    `;


    mysqlConnection.query(query,[id,email,password,POSTULANTE_idPOSTULANTE,TIPO_USUARIO_idTIPO_USUARIO],(err, rows, fields)=>{
        if(!err){
            res.json({Status:"User Updated!"});
        }
        else{
            console.log(err);
        }
    });
});

router.delete("/api/usuarios/:id",(req,res)=>{
   
    const {id}=req.params;

    mysqlConnection.query("DELETE FROM USUARIO WHERE idUSUARIO=?", [id], (err, rows, fields)=>{

        if(!err){
            res.json({Status:"User Deleted :("});
        }
        else{
            console.log(err);
        }
    })
});


module.exports = router;
