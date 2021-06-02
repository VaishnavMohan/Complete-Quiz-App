const router = require('express').Router();
const { db } = require('../model/Questions');
const Scoremodel = require('../model/Scoremodel');
const scoremodel = require('../model/Scoremodel');
const score = require('../model/Scoremodel');


router.post("/score", async (req, res) => {
 
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
  const scores = new Scoremodel({
    score: req.body.score,
  });
  try{
  db.collection('score') = await scores.save();
  res.send({scores: scores.score});
  // {
  //   // if (err) throw err;
  //   console.log(result);
  //   // var scores = result;
  //   return res.status(200).send({AddScore: 'success',scores});
  //   // return result;
  //   db.close();
  // })
}catch(err){
    res, status(400).send(err);
  }
  // try {
  //   const savedUser = await user.save();
  //   res.send({ user: user._id });
  // } catch (err) {
  //   res, status(400).send(err);
  // }
 
 
    });



module.exports = router;
