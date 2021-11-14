const express = require("express");

const router = express.Router();

const mysqlConnection = require("../db");

router.get("/api/organizacion-a-cargo", (req, res) => {
  const query = `SELECT * FROM ORGANIZACION_A_CARGO;`;

  mysqlConnection.query(query, (err, rows, fields) => {
    if (!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });
});

router.get("/api/organizacion-a-cargo/:id", (req, res) => {
  const { id } = req.params;
  const query = `SELECT * FROM ORGANIZACION_A_CARGO WHERE codigo_organizacion=?;`;
  mysqlConnection.query(query, [id], (err, rows, fields) => {
    if (!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });
});

router.post("/api/organizacion-a-cargo/add", (req, res) => {
  const query = `INSERT INTO ORGANIZACION_A_CARGO SET ?`;

  mysqlConnection.query(query, req.body, (err, result) => {
    err
      ? console.log(err)
      : res.status(201).send("Organizacion a Cargo registrada correctamente!");
  });
});



router.put('/api/organizacion-a-cargo/:id',(req, res)=>{

    const {id}=req.params;
    const query=`UPDATE ORGANIZACION_A_CARGO SET ? WHERE codigo_organizacion=?`;

    mysqlConnection.query(query,[req.body, id], (err, result)=>{
        err ? console.log(err) : res.send('Organizacion a cargo actualizada correctamente!');
    });
});


router.delete('/api/organizacion-a-cargo/:id', (req, res)=>{
    const {id}=req.params;
    const query=`DELETE FROM ORGANIZACION_A_CARGO WHERE codigo_organizacion=?`;
    mysqlConnection.query(query, id, (err, result)=>{
        err ? console.log(err) : res.send('Organizacion a  cargo - Eliminada!');
    });
});




module.exports = router;
