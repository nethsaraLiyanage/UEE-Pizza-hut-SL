const mongoose = require('mongoose');
const  Schema = mongoose.Schema;

const cart_item = new Schema({

    size:{
        type:String,
        required: true
    },
    crust:{
        type: String, 
        required: true, 
    },
    additions: {
        type: Array,
        required: true
    },
    count : {
        type : Number,
        required : true
    },
    totPrice : {
        type : Number,
        required : true
    },
    isSelected : {
        type : Boolean,
        required : false
    },
    pizzaPrice : {
        type : Number,
        required : true
    },
    image:{
        type:String,
        required: true
    },
    productName:{
        type:String,
        required: true
    },

})

const Cart_item = mongoose.model("cart_item", cart_item);
module.exports = Cart_item;