const express = require('express');
const Item = require('../modals/item');
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
    const data = await Item.create({
        size : req.body.size,
        crust : req.body.crust,
        additions : req.body.additions,
        count : req.body.count,
        totPrice : req.body.totPrice,
        isSelected : rec.body.isSelected
    })

    res.send(data)
});

// export router with all routes included
module.exports = router;