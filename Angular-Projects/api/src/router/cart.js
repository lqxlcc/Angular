const db = require('../db/db')

module.exports = {
    register: (app) => {
        

        // 查
        app.get('/cart', function(req, res){
           
            var userid = req.query.userid;
            
            var sql = `
                
            select 
                SQL_CALC_FOUND_ROWS
            * from 
            (select goods.describes, goods.price,goods.mainimg,cart.userid,cart.num,cart.gid,cart.id
            from 
            goods 
            INNER JOIN 
                        cart
                        ON cart.gid=goods.id)
            as G 
            where G.userid in (select user.id from user where user.id=${userid});
            select FOUND_ROWS() as rowscount;
            select 
                cart.num
                from 
            cart
             WHERE
                userid=${userid}
            `;
            /*
                select 
                SQL_CALC_FOUND_ROWS
                goods.describe, goods.price,goods.mainimg,cart.num
                from 
                    goods 
                    INNER JOIN 
                cart
                ON goods.id=cart.gid
                limit ${(page - 1) * limit}, ${limit};
                select FOUND_ROWS() as rowscount;
             */
            db.select(sql, function(data){
                
                res.send(data);
            })   
        })
        // 删
        app.post('/cartgoodsdel',function(req,res){
            var id = req.body.cartid;
            var sql =`
                delete from cart where id IN (${id})
            `;
            db.delete(sql,function(data){
                res.send(data);
                console.log(data)
            })

        })
        // Update 语句用于修改表中的数据。
        //语法：UPDATE 表名称 SET 列名称 = 新值 WHERE 列名称 = 某值
        app.post('/cartgoodsupdate',function(req,res){
            // 参数
            var id= req.body.cartid;
            
            var num= req.body.num;
            
         

            var sql=`
                update cart
                set cart.num='${num}'
                where cart.id='${id}';
                
            `;
            db.update(sql,function(data){
                console.log(data);
                res.send(data);
            })

        })
        /*
        
         
        
        
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
        
        */
    }
}