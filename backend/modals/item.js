const mongoose = require('mongoose');
const  Schema = mongoose.Schema;

const itemSchema = new Schema({

    itemTitle: {
        type: String,
        required: true
    },
    description:{
        type:String,
        required: true
    },
    price:{
        type: Number, 
        required: true, 
    }
})

const Item = mongoose.model("item", itemSchema);
module.exports = Item;