var express = require('express');
var bp = require('body-parser');
var path = require('path');
var app = express();
var http = require('http');

app.use(bp.urlencoded({extended: false}));

var cart = require('./cart.js');

<<<<<<< HEAD
=======
var login = require('./login.js');

>>>>>>> afa7874222b4361b4c05141d7e18ba22a4459571
var getHomeMessage = require('./getHomeMessage.js');
 
var list = require('./list');
var product = require('./product');

var myorder = require('./myorder');


module.exports = {
    start: function(_port){

        app.all('*', function(req, res, next) {
            res.header("Access-Control-Allow-Origin", "*");
            res.header("Access-Control-Allow-Headers", "Content-Type,Content-Length, Authorization, Accept,X-Requested-With");
            res.header("Access-Control-Allow-Methods","PUT,POST,GET,DELETE,OPTIONS");
            res.header("X-Powered-By",' 3.2.1')
            if(req.method=="OPTIONS") {
                res.send(200);
            } else {
                next();
            }
        });

        app.use(express.static(path.resolve(__dirname ,'../')));


        cart.register(app);
        login.register(app);
        getHomeMessage.register(app);

        list.register(app);
        product.register(app);

        myorder.register(app);
       

        app.listen(_port,function(){
            console.log('连接成功')
        });
    }
}