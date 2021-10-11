const express = require('express');
const Item = require('../modals/item');
const Cart_Item = require('../modals/cart_item')
const Cart = require('../modals/cart')
const app = express()

const router = express.Router({});


router.get('/', async (_req, res, _next) => {
    const data = await Item.find()

    res.send(data)
});

router.post('/', async (req, res, _next) => {
    const data = await Item.create({
        itemTitle : req.body.itemTitle,
        description : req.body.description,
        price : req.body.price,
        imageUrl : req.body.imageUrl,
        size : req.body.size,
        crust : req.body.crust,
        additions : req.body.additions,
        mini_desc : req.body.mini_desc
    })

    res.send(data)
});

router.post('/cart-item', async (req, res, _next) => {
    //console.log(req.body.additions);

    var totPrice = 0;
    for(i = 0; i < req.body.additions.length; i++){
        console.log(JSON.parse(req.body.additions[i]).price);
        totPrice = totPrice + JSON.parse(req.body.additions[i]).price
    }

    totPrice = totPrice + JSON.parse(req.body.pizzaPrice)

    console.log(totPrice);
    console.log(req.body.userId);


    const data = await Cart_Item.create({
        size : req.body.size,
        crust : req.body.crust,
        additions : req.body.additions,
        count : req.body.count,
        totPrice : totPrice,
        isSelected : false,
        pizzaPrice : req.body.pizzaPrice,
        image : req.body.image,
        productName : req.body.productName
    })

    res.status(200).send(data)
});


//get cart items from the cart fro logged in user
router.get('/get-cart-items/:id',async (req,res) =>{
    
    try {
        const items = await Cart.findOne({user_id : req.params.id}).populate('items')

        res.status(200).send(items['items'])
    } catch (error) {
        res.status(500).send(error)
    }

});

// export router with all routes included
module.exports = router;