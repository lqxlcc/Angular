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
                
                    sql +='order by saleqty desc';
               
                    // sql +='order by saleqty asc';
               
            }else if(sort == '价格高到低'){
                
                    sql+='order by saleprice desc';
            }else if(sort == '价格低到高'){
                    sql+='order by saleprice asc'
                
            }else if(sort == '综合'){
                 if(dec == 'false'){
                    sql+='order by price desc';
                }else{
                    sql+='order by price asc'
                }
            }

            db.select(sql,function(data){

                res.send(data);
            })
        })


        app.get('/addcart',function(req,res){
            let userId = req.query.userid;
            let gid = req.query.gid;

            let sql=`
                select 
                    *
                from
                    cart
                where
                    userid = ${userId}
            `;

            db.select(sql,function(data){
                var results;
                if(data.data.results){
                    results = eval(data.data.results);
                }

                if(results.length > 0){//说明cart里已有该用户,获取底下gid
                    let sql=`
                        select 
                            gid
                        from
                            cart
                        where
                            userid=${userId}
                    `;

                    db.select(sql,function(da){
                        let gidArray = da.data.results;

                        var idx;
                        // 遍历商品信息，查询是否该商品已存在
                        var bools = gidArray.some(function(item,index){
                            idx = index;
                            return item['gid'] == gid;

                        })
                        console.log(bools);

                        if(bools){//商品已存在,只改变数量
                            let sql=`
                                UPDATE cart 
                                SET 
                                    num = num+1
                                WHERE 
                                    userid = ${userId}
                                and
                                    gid=${gid}
                            `;

                            console.log(sql);
                            db.update(sql,function(updateRes){

                                qtys();
                            })

                        }else{
                            //商品不存在，直接写入
                            var sql =`
                                INSERT INTO cart (id,userid,gid,num) VALUES (id=id+1,${userId}, '${gid}',1)
                            `;
                            db.insert(sql,function(data){

                                qtys();
                            })

                        }

                       
                    })
                }else{
                    // 说明cart里没有该用户，直接添加进购物车
                   
                    var sql =`
                        INSERT INTO cart (id,userid,gid,num) VALUES (id=id+1,${userId}, '${gid}',1)
                    `;

                    db.insert(sql,function(data){
                        qtys();
                    })
                }

                //封装，返回当前添加商品后，获取总商品的数量，返回客户端

                function qtys(){

                        let sql =`
                            select
                                num
                            from
                                cart
                            where
                                userid=${userId};
                        `;

                        db.select(sql,function(dataRes){
                            res.send(dataRes);

                        })
                }

            })
 
        })

        app.get('/cartqty',function(req,res){
            let userid = req.query.userid;

            let sql =`
                select
                    num
                from
                    cart
                where
                    userid=${userid};
            `;

            db.select(sql,function(data){
                res.send(data);

            })

        })
    }
}