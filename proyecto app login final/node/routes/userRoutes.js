const userController = require("../controllers/userController");


module.exports=(app)=>{
    //peticiones de consulta
    app.get('/api/users/getAll',userController.getAll);

    //peticiones de insercion
    app.post('/api/users/create',userController.register);
};