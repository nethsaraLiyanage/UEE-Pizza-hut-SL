const mongoose = require('mongoose');
const  Schema = mongoose.Schema;

const cart_item = new Schema({

    size:{
        type:String,
        required: true
    },
    crust:{
        type: Number, 
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
    isSelcted : {
        type : Boolean,
        required : false
    },

})

const cart_item = mongoose.model("cart_item", cart_item);
module.exports = cart_item;