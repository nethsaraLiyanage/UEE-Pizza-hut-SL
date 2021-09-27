// app imports  
const express = require('express')
const app = express()
const bodyParser = require('body-parser')
const cors = require('cors')

//other consts
const PORT = process.env.PORT || 8080;

//Middleware
app.use(bodyParser.json())
app.use(cors())


//server start
app.listen(PORT, () =>{
    console.log('server is at', PORT);
});