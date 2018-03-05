const db = require('../db/db')

module.exports = {
    register: (app) => {
        // 查
        app.get('/cart', function(req, res){
           
            var page = (req.query.page || 1) * 1;
            var limit = (req.query.limit || 10) * 1;
            var sql = `
            select 
                SQL_CALC_FOUND_ROWS
                goods.describe, goods.price,goods.mainimg,cart.num
            from 
                goods 
                INNER JOIN 
            cart
            ON goods.id=cart.gid
            limit ${(page - 1) * limit}, ${limit};
            select FOUND_ROWS() as rowscount;`;
            
            db.select(sql, function(data){
                
                res.send(data);
            })   
        })
        /*
        
         
        // 删
        app.post('/goodsdel',function(req,res){
            var id = req.body.id;
            var sql =`
                delete from goods where id=${id}
            `;
            db.delete(sql,function(data){
                res.send(data);
            })

        })
         // 增
         
        app.post('/goodsinsert',function(req,res){
            // 参数
            var id= req.query.id;
            
            var price= req.query.price;
            var title= req.query.title;
            var bigtype= req.query.bigtype;
            var saleqty= req.query.saleqty;
            var date= req.query.date;

            var sql=`
                insert into
                    goods
                    (id,price,title,bigtype,saleqty,date) 
                VALUES
                    (id=id+1,${price},${title},${bigtype},${saleqty},${date});
            `;
            db.insert(sql,function(data){
                console.log(data);
                res.send(data);
            })

        })
        // Update 语句用于修改表中的数据。
        //语法：UPDATE 表名称 SET 列名称 = 新值 WHERE 列名称 = 某值
        app.post('/goodsupdate',function(req,res){
            // 参数
            var id= req.body.id;
            console.log(id)
            var price= req.body.price;
            console.log(price)
            var title= req.body.title;
            console.log(title)
            var type= req.body.type;
           
            var saleqty= req.body.saleqty;
            console.log(saleqty)
         

            var sql=`
                update goods, bigtype
                set goods.price='${price}', goods.title='${title}', goods.saleqty='${saleqty}',bigtype.type='${type}'
                where goods.id='${id}';
                
            `;
            db.update(sql,function(data){
                console.log(data);
                res.send(data);
            })

        })
        */
    }
}