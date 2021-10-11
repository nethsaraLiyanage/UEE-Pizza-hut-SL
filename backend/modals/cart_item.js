const mongoose = require('mongoose');
const  Schema = mongoose.Schema;

const cart_item = new Schema({

    item_id: {
        type: Schema.Types.ObjectId,
        ref: 'item'
    },
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
    totPrice : {
        type : Number,
        required : false
    },
    isSelected : {
        type : Boolean,
        required : false
    },
    pizzaPrice : {
        type : Number,
        required : false
    },
    image : {
        type : String,
        required : false
    },
    productName : {
        type : String,
        required : false
    },
})

const cart_itemObj = mongoose.model("cart_item", cart_item);
module.exports = cart_itemObj;