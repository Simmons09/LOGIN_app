const express=require('express');
const app=express();
const http=require('http');
const server=http.createServer(app);
const logger=require('morgan');
const cors=require('cors');

const users=require("./routes/userRoutes");

const port =process.env.PORT || 3000;

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({
    extended:true
}));

app.use(cors());

app.disable('x-powered-by');

app.set('port',port);

users(app);



server.listen(port,'192.168.137.131'||'localhost',function(){
console.log('Aplicacion NodeJS id => '+process.pid+' puerto '+port);
});

app.use((err,req,res,next)=>{
    console.log(err);
    res.status(err.status || 500).send(err.stack);
});

module.exports={
    app:app,
    server:server
};