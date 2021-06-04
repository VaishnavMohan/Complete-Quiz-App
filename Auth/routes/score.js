const router = require('express').Router();
const mongoose = require('mongoose');
const { db } = require('../model/Questions');
const Scoremodel = require('../model/Scoremodel');



router.post("/score",   async (req, res) => {

  // var myData = new Scoremodel(req.body);
  // req.rawBody=buf;
  // console.log(req.rawBody);

//  myData.save()
//  db.collection('score').insertOne(myData, function(err, result){
//    console.log(myData);
//    return res.status(200).send({Pass_Score: 'success',myData});
//  })
 const myData = new Scoremodel({
  name: req.body.name,
  score: req.body.score,
});

// save new user
try {
  const savedScore = await myData.save();
  res.send(savedScore);
} catch (err) {
  return res.status(200).send({Pass_Score: 'success',myData});
}



//  .then(item => {
//  res.send("item saved to database");
//  })
//  .catch(err => {
//  res.status(400).send("unable to save to database");
//  });
  
  // var myScore ={ score : req.body.score},
  // mongoose.connect(url ,function(err, db){
    // db.collection('score').insertOne(item, function(err, result){
    //   console.log("Score Inserted")
    //   db.close();
    // })
  // })
  // myScore.save()
  //   .then(item => {
  //     res.send("item saved to database");
  //   })
  //   .catch(err => {
  //     res.status(400).send("unable to save to database");
  //   });
  // const scores = new Scoremodel({
  //   score: req.body.score,
  // });
  // try{
  // db.collection('score') = await scores.save();
  // res.send({});
  // {
  //   // if (err) throw err;
  //   console.log(result);
  //   // var scores = result;
  //   return res.status(200).send({AddScore: 'success',scores});
  //   // return result;
  //   db.close();
  // })

  // try {
  //   const savedUser = await user.save();
  //   res.send({ user: user._id });
  // } catch (err) {
  //   res, status(400).send(err);
  // }
 
 
    });



module.exports = router;
