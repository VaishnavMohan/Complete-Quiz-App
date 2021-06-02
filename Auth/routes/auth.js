const router = require('express').Router();
const User = require('../model/User');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');    
const { loginValidation, registerValidation } = require("../validation");
// const fs = require('fs');


// REGISTER
router.post("/register", async (req, res) => {
    // LETS VALIDATE THE DATA BEFORE WE ADD A USER
    const { error } = registerValidation(req.body);
    if (error) return res.status(400).send(error.details[0].message);
  
    // chk if new user already in db
    const emailExist = await User.findOne({ email: req.body.email });
    if (emailExist) {
      return res.status(400).send("Email already exists");
    }
  
    // hash passwords
    const salt = await bcrypt.genSalt(10);
    const hashPassword = await bcrypt.hash(req.body.password, salt);
  
    // create new user
    const user = new User({
      name: req.body.name,
      email: req.body.email,
      password: hashPassword
    });
  
    // save new user
    try {
      const savedUser = await user.save();
      res.send({ user: user._id });
    } catch (err) {
      res, status(400).send(err);
    }
  });
  

router.post('/login', async (req,res)=>{

    // Validation
  const { error } = loginValidation(req.body);
  if (error) return res.status(200).send(error.details[0].message);

  // chk if email exists
  const user = await User.findOne({ email: req.body.email });
  if (!user) return res.status(200).send({Login_status: 'failed', message: "Incorrect Email" });

  // chk if password is correct
  const validPass = await  bcrypt.compare(req.body.password, user.password);
  if (!validPass) return res.status(200).send({Login_status: 'fail', message: "Incorrect Password" });


//   const token = jwt.sign({ _id: user._id }, 'ajjsadhjhdsjhajd');
//   res.header("auth-token", token).send(token);

return res.status(200).send({Login_status: 'success', message: "Login is Succesfull" });

});
// router.post('/getUsers', function(req, res){
//   fs.readFile(__dirname, "/" + "users.json", function(err, data){
//       console.log(data);
//       res.send(data); 
//   });
// })


module.exports = router;
