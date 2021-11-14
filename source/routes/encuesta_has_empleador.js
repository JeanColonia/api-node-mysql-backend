
const express=require('express');
const router=express.Router();
const mysqlConnection=require('../db');


router.get('/api/encuesta-has-empleador', (req, res)=>{

    const query=`SELECT * FROM ENCUESTA_HAS_EMPLEADOR`;

    mysqlConnection.query(query, (err, result)=>{

        err ? console.log(err) : res.send(result);
    });
});

router.get('/api/encuesta-has-empleador/:id', (req, res)=>{

        const {id}=req.params;
        const query=`SELECT * FROM ENCUESTA_HAS_EMPLEADOR WHERE id`
});