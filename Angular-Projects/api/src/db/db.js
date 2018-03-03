var mysql = require('mysql');

var db = mysql.createPool({
    connectionLimit: 10,
    host: "10.3.136.9",
    user: 'root',
    password: '',
    database: 'orchard',
    multipleStatements: true
})

module.exports = {
    select: function(_sql, _callback){
        db.query(_sql, function(error, results, fields){
            if(error){
                _callback({status: false, error: error})
            } else {
                _callback({status: true, data: {results, fields}});
            }

        })
    },
    insert: function(_addSql,_callback){
        db.query(_addSql,function (error, results,fields) {
            if(error){
                _callback({status: false, error: error})
                 return;
            }else{
                _callback({status: true, data: {results, fields}});
            }
        });
    },
    update: function(_modsql,_callback){
        db.query(_modsql,function (error,results,fields) {
           
            if(error){
                _callback({status: false, error: error})
                return;
            }else{
                _callback({status: true, data: {results, fields}});
            }
        })
    },
    delete: function(_delsql,_callback){
        db.query(_delsql,function (error,results,fields) {
            if(error){
                _callback({status: false, error: error})
                return;
            }else{
                _callback({status: true, data: {results, fields}});
            }

        })
    }
}