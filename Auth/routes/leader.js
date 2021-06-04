const router = require('express').Router();
const mongoose = require('mongoose');
const { db } = require('../model/Scoremodel');
const Questions = require('../model/Scoremodel');


router.post("/leader", async (req, res) => {
    // await db.questions.find().forEach(printjson);
    // console.log(questions);
    var top;
  db.collection("scoremodels").find({}).toArray(function(err, result) {
      if (err) throw err;
      console.log(result);
      var top = result;
      return res.status(200).send({Pass_Score: 'success',top});
      // return result;
      db.close();
    });

})


module.exports = router;
