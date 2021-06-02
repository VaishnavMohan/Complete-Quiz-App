const router = require('express').Router();
const { db } = require('../model/Questions');
const Questions = require('../model/Questions');


// router.post("/questions", async (req, res) => {
  
//    // create new question
//     const questions = new Questions({
//       question: req.body.question,
//       answer: req.body.answer,
//     });
//     // save new question
//     try {
//       const savedQues = await questions.save();
//       res.send(savedQues);
//     } catch (err) {
//       res, status(400).send(err);
//     }
//   });

router.post("/answers", async (req, res) => {
  // await db.questions.find().forEach(printjson);
  // console.log(questions);
  var questions;
db.collection("questions").find({}).toArray(function(err, result) {
    if (err) throw err;
    console.log(result);
    var question = result;
    return res.status(200).send({Pass_Question: 'success',question});
    // return result;
    db.close();
  });
  // return res.status(200).send(questions);
  // return res.status(200).send(questions);

  // const answer = await Questions.findOne({ answer: req.body.answer });
})


  module.exports = router;
