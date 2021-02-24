var mysql = require('mysql');
var con = mysql.createConnection({
    host: getenv("DB_HOST"),
    user: getenv("DB_USER"),
    password: getenv("DB_PASS"),
    database: getenv("DB_NAME")
});
con.connect(function(err) {
    if (err) throw err;
});
module.exports = con;
