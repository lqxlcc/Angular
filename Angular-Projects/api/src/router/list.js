var db = require('../db/db');

module.exports = {
    register:function(app){
        app.get('/goodslist',function(req,res){

            let bigId = req.query.classify;
            let sort = req.query.sort;
            let dec = req.query.dec;

            console.log(bigId,sort,dec);

            var sql = `
                select 
                    s.id,s.type
                from
                    smalltype s
                where
                    s.bigtypeid=${bigId};
                select 
                      g.*,
                      s.type
                from
                      goods g LEFT JOIN smalltype s on g.smalltypeid = s.id LEFT JOIN bigtype b on g.bigtypeid=b.id
                WHERE
                    g.bigtypeid=${bigId}
                AND
                    s.bigtypeid =${bigId}
            `;

            if(sort == '销量'){
                
                if(dec == 'false'){
                  
                    sql +='order by saleqty desc';
                }else{  
                   
                    sql +='order by saleqty asc';
                }
            }else if(sort == '价格'){
                if(dec == 'false'){
                    sql+='order by saleprice desc';
                }else{
                    sql+='order by saleprice asc'
                }
            }
            // else if(sort == '综合'){
            //      if(dec == 'false'){
            //         sql+='order by price desc';
            //     }else{
            //         sql+='order by price asc'
            //     }
            // }

            db.select(sql,function(data){

                res.send(data);
            })

        })

    }
}