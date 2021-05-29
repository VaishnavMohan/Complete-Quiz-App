const router = require('express').Router();
const User = require('../model/Questions');


router.get('/questions', async (req, res) => {

    // create new questions
    const user = new Questions({
      question: req.body.question,
      answer: req.body.answer,
    });
  
    // save new questions
    try {
      const ques = await question.save();
      res.send({ question: question._id });
    } catch (err) {
      res, status(400).send(err);
    }
  });