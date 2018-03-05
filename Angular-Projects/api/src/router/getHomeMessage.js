var db = require('../db/db');
module.exports = {
    register:function(app){
        app.get('/getHomeSeasonFruit',function(req,res){
            var sql = `select * from goods where hot='y' and bigtypeid=6`;
            db.select(sql,function(result){
                res.send(result);
            })
        })
        app.get('/getHomeHotFruit',function(req,res){
            var sql = `select * from goods where hot='y' and bigtypeid=1`;
            db.select(sql,function(result){
                res.send(result);
            })
        })
        app.get('/getHomeSeafood',function(req,res){
            var sql = `select * from goods where hot='y' and bigtypeid=3`;
            db.select(sql,function(result){
                res.send(result);
            })
        })
        app.get('/getHomeMeat',function(req,res){
            var sql = `select * from goods where hot='y' and bigtypeid=4`;
            db.select(sql,function(result){
                res.send(result);
            })
        })
        app.get('/getHomeMilk',function(req,res){
            var sql = `select * from goods where hot='y' and bigtypeid=5`;
            db.select(sql,function(result){
                res.send(result);
            })
        })
    }
}