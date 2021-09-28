// app imports  
const express = require('express')
const mongoose = require('mongoose');
const dotenv = require('dotenv');
const cors = require('cors');
const bodyParser = require('body-parser');

//route imports
const product = require('./routes/product')



//other consts
const PORT = process.env.PORT || 8000;
const MONGODB_URI = process.env.MONGODB_URI;

//Middleware
dotenv.config();
const app = express();
app.use(bodyParser.json())
app.use(cors())

app.use('/product',product)


mongoose.connect(
    process.env.MONGODB_URI,
    {useNewUrlParser: true , useUnifiedTopology:true},
    () =>{
        console.log("connected to the database")
    }
)

//server start
app.listen(PORT, () =>{
    console.log('server is at', PORT);
});