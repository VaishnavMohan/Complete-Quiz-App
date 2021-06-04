const { number } = require('joi');
const mongoose = require('mongoose');

const scoreSchema = new mongoose.Schema({
    name:{
        type: String,
        required: true,
        
    },
    score:{
        type: Number,
        required: true,
      
    },
});

module.exports = mongoose.model('Scoremodel', scoreSchema);