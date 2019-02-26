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

        app.get('/estimate',function(req,res){
            let gid = req.query.gid;

            let sql=`
                select 
                    g.*,
                    u.phone
                from
                    grade g 
                    inner join user u on g.userid=u.id
                where
                    gid=${gid}
            `;

            db.select(sql,function(data){
                res.send(data);

            })
        })
    }
}