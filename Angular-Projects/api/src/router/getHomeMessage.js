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
        app.get('/getHomeMoods',function(req,res){
            var sql = `select * from goods where saleqty>200`;
            db.select(sql,function(result){
                res.send(result);
            })
        })
        app.get('/fuzzySearch',function(req,res){
            var keyWord = req.query.keyWord;
            var sql = 'select * from goods where concat (title,describes) like "%'+keyWord+'%"';
            db.select(sql,function(result){
                res.send(result);
            })
        })
        app.post('/addSingleGood',function(req,res){
            var userid = req.body.userid;
            var gid = req.body.gid;
            var sql = `select * from cart where userid=${userid} and gid=${gid}`;
            var num = 1;
            db.select(sql,function(result){
                if(result.data.results[0]){
                    num += result.data.results[0]['num'];
                    var sql2 = `update cart set num=${num} where userid=${userid} and gid=${gid}`;
                    db.update(sql2,function(result2){
                        res.send(result2);
                    })
                }else{
                    var sql3 = `insert into cart (userid,gid,num) values (${userid},${gid},${num})`;
                    db.insert(sql3,function(result3){
                        res.send(result3);
                    })
                }
            })
        })
    }
}