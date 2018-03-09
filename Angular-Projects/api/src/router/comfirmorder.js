const db = require('../db/db');

module.exports = {
    register: (app) => {
        // 增
        app.post('/orderproduct',function(req,res){
            let comfirmorders = JSON.parse(req.body.comfirmorders);
            //console.log(comfirmorders);
            let orderStatus = req.body.orderStatus;
            for(let j=0;j<comfirmorders.length;j++){

                let uid = comfirmorders[j].userid;
                let gid = comfirmorders[j].gid;
                let num = comfirmorders[j].num;
                let total = 0;
                total += num*comfirmorders[j].price;


                let sql = `insert into orders(userid,total,status) values (${uid},${total},${orderStatus});`
                db.insert(sql,(result)=>{
                    sql = "";
                    console.log(result);
                    let orderid = result.data.results.insertId;
                    //res.send(result)   
                    sql = `insert into orderproduct(gid,orderid,qty) values(${gid},${orderid},${num});`;   
                    
                    db.insert(sql,(inserResults)=>{
                        var orderid = inserResults.data.results.insertId;
                        sql = '';
                        sql = `select * from orderproduct where id = ${orderid}`;
                        db.select(sql,function(res2){
                            res.send(res2)
                        
                        })
                        
                    })
                
                })
            }

            
        })
    }
}