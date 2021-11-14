const { query, request } = require("express");
const express = require("express");

const router = express.Router();

const mysqlConnection = require("../db");

router.get("/api/empleador", (req, res) => {
  const query = `SELECT * FROM EMPLEADOR;`;

  mysqlConnection.query(query, (err, rows, fields) => {
    if (!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });
});

router.get("/api/empleador/:id", (req, res) => {
  const { id } = req.params;
  const query = `SELECT * FROM EMPLEADOR WHERE idEMPLEADOR=?;`;

  mysqlConnection.query(query, [id], (err, rows, fields) => {
    if (!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });
});

router.post("/api/empleador/add", (req, res) => {
  const query = `INSERT INTO EMPLEADOR SET ?`;
  mysqlConnection.query(query, req.body, (err, rows, fields) => {
    err ? console.log(err) : res.status(201).send(`Empleador agregado!`);
  });
});

router.put("/api/empleador/:id", (req, res) => {
  const { id } = req.params;

  const query = `UPDATE EMPLEADOR SET ? WHERE idEMPLEADOR=?`;

  mysqlConnection.query(query, [req.body, id], (err, result) => {
    err ? console.log(err) : res.send("Empleador Actualizado Correctamente!");
  });
});

router.delete("/api/empleador/:id", (req, res) => {
  const { id } = req.params;
  const query = `DELETE FROM EMPLEADOR WHERE idEMPLEADOR=?`;

  mysqlConnection.query(query, id, (err, result) => {
    err ? console.log(err) : res.send("Empleador eliminado correctamente!");
  });
});

module.exports = router;
