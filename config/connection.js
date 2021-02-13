const mysql = require('mysql2');

require('dotenv').config();

const connection = mysql.createConnection({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'password', // process.env.MYSQL_PASSWORD,
    database: 'employee'
});

module.exports = connection;
