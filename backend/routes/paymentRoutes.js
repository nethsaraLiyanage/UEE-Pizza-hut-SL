const express = require('express');
const Card = require('../modals/PaymentCard');
const Payment = require('../modals/Payment');
const User = require('../modals/user');
const app = express()

const router = express.Router({});

router.post("/addCard", async (req, res) => {

    const {
        cardNumber,
        expiryDate,
        cardHolderName,
        cvvCode,
        cardHolder,
    } = req.body
    try {
        const data = await Card.create({
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            cardHolder: cardHolder,
        }).then(async (card) => {
            await User.updateOne({_id : cardHolder},{$push : {reports : card._id}})
            .then((result) => {
                res.json({ status: 201, message: "ok" })
            })
            .catch((err) => {
                console.log("Error in updating user")
                res.json({ status: 400, message: err })
            })
        }).catch((err) => {
            console.log("Error in creating card")
            res.json({ status: 400, message: err })
        })

    } catch (err) {
        console.log("Error : " , err)
        res.json({ error: err , status: 400 })
    }

  });

module.exports = router;