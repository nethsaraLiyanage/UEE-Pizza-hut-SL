const express = require("express");
const app = express();
const User = require("../modals/user");
const router = require("express").Router();
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");


//User Registration
router.post("/register", async (req, res) => {

  const isExisting = await User.findOne({ email: req.body.email });

  if (isExisting) {
    res.json({ status: 401, message: "user already exist" });
  } else {
    let full_name = req.body.full_name;
    let email = req.body.email;
    let mobile_number = req.body.mobile_number;
    let delivery_address = req.body.delivery_address;
    let password = req.body.password;

    const salt = await bcrypt.genSalt();
    const hash = await bcrypt.hash(password, salt);

    const user = await new User({
      fullName: full_name,
      email: email,
      mobileNumber: mobile_number,
      deliveryAddress: delivery_address,
      password: hash,
    });

    user.save().then(() => {
      res.json({ status: 201, message: "user registered" });
    });
  }
});


//User Login
router.post("/login", async (req, res) => {
  try {
    let email = req.body.email;
    let password = req.body.password;

    const user = await User.findOne({ email: email });

    if (user) {
      const auth = await bcrypt.compare(password, user.password);
      if (auth) {
        const accessToken = jwt.sign(
          { user },
          process.env.ACCESS_TOKEN_SECRET_KEY,
          {
            expiresIn: "1h",
          }
        );
        res.json({ status: 200, token: accessToken, user: user });
      } else {
        res.json({ status: 401, message: "unauthorized" });
      }
    } else {
      res.json({ status: 404, message: "user does not exist." });
    }
  } catch (err) {
    res.json({ error: err });
  }
});


//View User Profile
router.get("/:id", async (req, res) => {
  try {
    
    let userID = req.params.id;
    const user = await User.findOne({ _id: userID });

    if (user) {
        res.json({ status: 200, user: user});
    } else {
      res.json({ status: 404, message: "user does not exist." });
    }
  } catch (err) {
    res.json({ error: err });
  }
});


//Update User Profile
router.put("/update/:id", async (req, res) => {

  try{
  const userID = req.params.id;
  let updateUser;

    let full_name = req.body.full_name;
    let email = req.body.email;
    let mobile_number = req.body.mobile_number;
    let delivery_address = req.body.delivery_address;

    updateUser = {
      fullName: full_name,
      email: email,
      mobileNumber: mobile_number,
      deliveryAddress: delivery_address,
    };
  
  await User.findByIdAndUpdate(userID, updateUser).then((user) => {
    res.json({ status: 200, message: "user updated", user: user });
  });

  }

catch(e){
  res.json({ status: 200, error: e });
}

});

//update password
router.put("/update_password/:id", async (req, res) => {

  try{

  const userID = req.params.id;
  let updateUser;

    let user = await User.findOne({_id: userID});
    const auth = await bcrypt.compare(req.body.old_password, user.password);

    if(auth){
      let password = req.body.new_password;
  
      const salt = await bcrypt.genSalt();
      const hash = await bcrypt.hash(password, salt);

      updateUser = {
        password: hash,
      };
    }
    else{
      res.json({ status: 401, error: "Password does not match" });
    }

  await User.findByIdAndUpdate(userID, updateUser).then((user) => {
    res.json({ status: 200, message: "password updated", user: user });
  });
}
catch(e){
  res.json({ status: 200, error: e });
}

});


module.exports = router;
