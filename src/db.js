const mysql = require('mysql');

let dbConnection = ''
if (process.env.NODE_ENV === 'production') {
    dbConnection = mysql.createConnection({
        host: process.env.DB_HOST,
        port: process.env.DB_HOST_PORT,
        database: process.env.DB_DATABASE,
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD,
        dateStrings: true,
    })
} else {
    dbConnection = mysql.createConnection({
        host: process.env.DB_HOST_TEST,
        port: process.env.DB_HOST_PORT_TEST,
        database: process.env.DB_DATABASE_TEST,
        user: process.env.DB_USER_TEST,
        password: process.env.DB_PASSWORD_TEST,
        dateStrings: true,
    })
}

module.exports = {
    conexaoDb: dbConnection
}
