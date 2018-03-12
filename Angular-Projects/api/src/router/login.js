const db = require('../db/db')

module.exports = {
    register: (app) => {
        // 查
        app.get('/login', function(req, res){
            var phone = req.query.phone;
            var password = req.query.password;
            console.log(phone,password);
            var sql = `
            select 
               
                *
            from 
                user
                
            where phone = '${phone}' and password='${password}';
            `;
           
            db.select(sql, function(data){
            
                var _data = data.data.results;
                
                if(_data.length<=0){
                    
                    res.send('false');
                    
                }else{
                    res.send(_data);

                }
                

            })   
        })
        app.get('/registerVer', function(req, res){
            var phone = req.query.phone;
            var sql = `
            select 
               
                *
            from 
                user
                
            where phone = '${phone}';
            `;
            
            db.select(sql, function(data){
                var _data = data.data.results;
                console.log(_data)
                if(_data.length<=0){
                    res.send('false');
                }else{
                    res.send('true');

                }
            })   
        })

        // 增
         
        app.post('/register',function(req,res){
            // 参数
            var id= req.body.id;
            
            var phone= req.body.phone;
            var password= req.body.password;
            

            var sql=`
                insert into
                    user
                    (id,phone,password) 
                VALUES
                    (id=id+1,${phone},${password});
            `;
            db.insert(sql,function(data){
                console.log(data);
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