const express = require('express');
const Card = require('../modals/PaymentCard');
const Payment = require('../modals/Payment');
const User = require('../modals/user');
const Cart = require('../modals/cart');
const cartItem = require('../modals/cart_item');
const Item = require('../modals/item');
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
            await User.updateOne({_id : cardHolder},{$push : {PaymentCards : card._id}})
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


  //Get payment details by user id
  router.get("/getPaymentDetailsByUserId/:id", async (req, res) => {

    try {
        await Cart.findOne({ user_id: req.params.id})
        .populate('items')
        .then(async(data) => {
            let itemCount = 0;
            let totalPrice = 0;
            let selectedItems = [];
            if(data.items != null){
                data.items.map((item)=>{
                    if(item.isSelected){
                        console.log(item);
                        itemCount++;
                        totalPrice = totalPrice + item.totPrice;
                        selectedItems.push(item);
                    }

                })
            }
            let paymentCards = [];
            const userCards = await User.findById(req.params.id)
            .populate('PaymentCards')
            .then(userData => {
                if(userData.PaymentCards != null){
                    userData.PaymentCards.map((item)=>{
                        paymentCards.push(item);
                    })
                }
                res.json({
                    cardId : data._id,
                    itemCount : itemCount,
                    totalPrice : totalPrice,
                    selectedItems : selectedItems,
                    paymentCards: paymentCards
                });
            }).catch((err) => {
                res.json({errpr : err , message:"Error in getting user details"});
            })
         }).catch((err) => {
             res.json({errpr : err , message:"Error in getting cart details"});
         })
     } catch (error) {
        console.log(error)
        res.json({error: error})
     }

  });

module.exports = router;