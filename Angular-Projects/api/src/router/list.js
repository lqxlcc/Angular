var db = require('../db/db');

module.exports = {
    register:function(app){
        app.get('/goodslist',function(req,res){
            let keyword =req.query.keyword;
            let type = req.query.type;
            let dec = req.query.desc;

            var sql = `
                select 
                    g.*
                from
                    goods g
                inner join bigtype b on g.bigtype = b.id
                where   
                    b.type ="${keyword}"
            `;

            if(type == "价格"){

            }

            db.select(sql,function(data){

                res.send(data);
            })

        })

    }
}