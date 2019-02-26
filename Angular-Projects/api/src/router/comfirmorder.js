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

            
        }),
        app.post('/orderStatus',function(req,res){
            var id= req.body.orderid;
            
            var orderStatus= req.body.orderStatus;
            var sql=`
                update orders
                set orders.status='${orderStatus}'
                where orders.id='${id}';
                
            `;
            db.update(sql,function(data){
                console.log(data);
                res.send(data);
            })
        }),
        app.get('/orders',function(req,res){
            var id= req.body.orderid;
            
            var sql=`
                select *
                from
                 orders
                where orders.id='${id}';
                
            `;
            db.select(sql,function(data){
                console.log(data);
                res.send(data);
            })
        })
        app.post('delgid',function(req,res){
            let userid = req.body.userid;
            let cartgid = req.body.cartgid;

            let sql=`
                delete 
                    *
                form
                    cart

            `;


        })
    }
}