var db = require('../db/db');

module.exports = {
    register:function(app){
        app.get('/product',function(req,res){
            let gid =req.query.gid;
           
            var sql = `
                select 
                    *
                from
                    goods
                where   
                    id="${gid}"
            `;

            db.select(sql,function(data){

                res.send(data);
            })

        })

    }
}