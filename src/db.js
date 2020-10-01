const mysql = require('mysql');

const dbConnection = mysql.createConnection({
    host: process.env.DB_HOST,
    port: process.env.DB_HOST_PORT,
    database: process.env.DB_DATABASE,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    dateStrings: true,
})

module.exports = {
    conexaoDb: dbConnection
}
