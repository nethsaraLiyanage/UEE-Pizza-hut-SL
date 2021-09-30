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
    count : {
        type : Number,
        required : true
    }
})

const cart_item = mongoose.model("cart_item", cart_item);
module.exports = cart_item;