const db = require('../db/db')

module.exports = {
    register: (app) => {
        
        
        
        // 增
         
        app.post('/orderproduct',function(req,res){

            

            let comfirmorders = req.body.comfirmorders;
            console.log(comfirmorders);
            
            for(let j=0;j<comfirmorders.length;j++){

                let uid = comfirmorders[j].userid;
                let gid = comfirmorders[j].gid;
                let num = comfirmorders[j].num;
                let total = comfirmorders[j].total;


                let sql = `insert into orders(userid,total,status) values (${uid},${total},0);`
                db.insert(sql,(result)=>{
                    sql = "";
                    console.log(result.data);
                    let orderid = result.data[0].id;
                    
                    let gids = gid.split(',');
                    let qtys = qty.split(',');
                    for(let i=0;i<gids.length;i++ ){
                        var qtyNumber=Number(qtys[i]);
                        
                        sql += `insert into orderproduct(gid,orderid,qty) values(${gids[i]},${orderid},${qtyNumber});`;
                    }
                    db.insert(sql,(inserResults)=>{
                        var orderid = inserResults.data.results.insertId;
                        sql = '';
                        sql = `select * from orderproduct where id = ${orderid}`;
                        db.select(sql,function(res2){

                            if(comfirmorders.length == j){

                                res.send(res2);
                            }
                        })
                        
                    })
                
                })
            }

            
        })
        
        
       
    }
}