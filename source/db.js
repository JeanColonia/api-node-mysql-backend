
const mysql=require('mysql');



mysqlConfig={
    host:'localhost',
    user:'root',
    password:'admin',
    database:'master_db',
    multipleStatements: true
    };

const mysqlConnection=mysql.createPool(mysqlConfig);

/*
mysqlConnection.connect((err)=>{
    if(err){
        console.log(err);
    }
    else{
        console.log('DB Connected');
    }
});

*/
module.exports=mysqlConnection;


