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
        app.post('/addNewAddress',function(req,res){
            var userid = req.body.userid;
            var username = req.body.username;
            var userphone = req.body.userphone;
            var usercity = req.body.usercity;
            var userroad = req.body.userroad;
            var userroom = req.body.userroom;
            var sql = `insert into useraddress (userid,name,phone,city,road,room) values (${userid},${username},${userphone},${usercity},${userroad},${userroom})`;
            db.insert(sql,function(result){
                res.send(result);
            })
        })
        app.get('/getAddress',function(req,res){
            var id = req.query.addressId;
            var sql = `select * from useraddress where id=${id}`;
            db.select(sql,function(result){
                res.send(result);
            })
        })
        app.post('/updateAddress',function(req,res){
            var id = req.body.id;
            var name = req.body.username;
            var phone = req.body.userphone;
            var city = req.body.usercity;
            var road = req.body.userroad;
            var room = req.body.userroom;
            var sql = `update useraddress dz_join set name=${name},phone=${phone},city=${city},road=${road},room=${room} where id=${id}`;
            db.update(sql,function(result){
                res.send(result);
            })
        })
    }
}