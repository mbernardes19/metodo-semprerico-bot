import mysql from 'mysql2/promise';
import dotenv from 'dotenv';
import path from 'path';
if(process.env.NODE_ENV === 'production') {
    dotenv.config({path: path.join(__dirname, '..', '.env') })
} else {
    dotenv.config({path: path.join(__dirname, '..', '.env.test') })
}

const dbConnection = mysql.createConnection({
    host: process.env.DB_HOST,
    port: parseInt(process.env.DB_HOST_PORT, 10),
    database: process.env.DB_DATABASE,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    dateStrings: true,
})

export { dbConnection as conexaoDb }