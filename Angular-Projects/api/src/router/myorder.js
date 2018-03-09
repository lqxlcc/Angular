var db = require('../db/db');

module.exports = {
	register:function(app){
		app.get('/orderAll',function(req,res){
			let userid = req.query.userid;
			let sql = `
				select 
					o.*,
					u.id,
					od.*,
					g.*
				from
					orders o
					inner join user u on o.userid = u.id
					inner join orderproduct od on o.id = od.orderid
					inner join goods g on g.id = od.gid
				where 
					userid = 2`;
			db.select(sql,(data)=>{
				res.send(data);
				// console.log(data);
			})
		})

		app.get('/paying',function(req,res){
			let userid = req.query.userid;
			let sql = `
				select 
					o.*,
					u.id,
					od.*,
					g.*
				from
					orders o
					inner join user u on o.userid = u.id
					inner join orderproduct od on o.id = od.orderid
					inner join goods g on g.id = od.gid
				where 
					userid = 2 and status= 0`;
			db.select(sql,(data)=>{
				res.send(data);
			})
		})

		app.get('/delorder',function(req,res){
			// let ids = req.body.ids;//购物车商品id
			let userid = req.query.userid;
			let gid = req.query.gid;
			let oid = req.query.orderid;
			console.log(userid,gid,oid);
			let sql = `
					delete 
						
						from
						orderproduct
					where 
						orderid in (${oid}) and gid in (${gid})`;
				
				
			db.delete(sql,(date)=>{
				
				sql = `select 
					o.*,
					u.id,
					od.*,
					g.*
				from
					orders o
					inner join user u on o.userid = u.id
					inner join orderproduct od on o.id = od.orderid
					inner join goods g on g.id = od.gid
				where 
					userid = ${userid}`;
				db.select(sql,(dates)=>{
				
					res.send(dates);
				})
			})
		})
		app.get('/orderstatuss',function(req,res){
			let status = req.body.statu;
			let orderid = req.body.orderid;
 			console.log(status,orderid);

			let sql =`
				update 
					orders
                set 
                	orders.status=${status}
                where 
                	orders.id='${orderid}'

			`;

			db.update(sql,function(res){
				res.send(res);
			})

		})
	}
}