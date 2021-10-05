const mongoose = require('mongoose');
const  Schema = mongoose.Schema;

const cart = new Schema({

    user_id: {
        type: Schema.Types.ObjectId,
        ref: 'user'
    },
    items:[{type : Schema.Types.ObjectId , ref : 'cart_item'}]
    
})

const cart = mongoose.model("cart", cart);
module.exports = cart;