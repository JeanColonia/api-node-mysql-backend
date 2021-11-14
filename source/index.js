const express=require('express');
const server_app=express();


/*---------------------Settings---------------*/

server_app.set('port', process.env.PORT||4000);


/*---------------------Middlewars---------------*/

server_app.use(express.json());

/*---------------------Routes---------------*/

/*ROUTER TO ENCUESTAS*/ 
server_app.use(require('./routes/encuesta-servicio'));
/*ROUTER TO POSTULANTES*/
server_app.use(require('./routes/postulantes'));
/*ROUTER TO SERVICIOS*/
server_app.use(require('./routes/servicios'));

/** ROUTER TO USUARIOS */
server_app.use(require('./routes/usuarios'));

/* ROUTER TO EMPLEADOR */

server_app.use(require('./routes/empleador'));


/** ROUTER TO ORGANIZACIÓN A CARGO */

server_app.use(require('./routes/organizacion-a-cargo'));


/* ROUTER TO ATENCIÓN - SERVICIO */

server_app.use(require('./routes/atencion-servicio'));











/*-----------------------------VIEWS----------------*/

server_app.use(require('./routes/views/view-encuesta'));




/*--------------------- Init Server---------------*/
server_app.listen(server_app.get('port'),()=>{
    console.log('Server on PORT',server_app.get('port'));
});