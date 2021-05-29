const mongoose = require('mongoose');

const questions = new mongoose.Schema({
    question:{
        type: String,
        required: true,
        
    },
    answer:{
        type: String,
        required: true,
        
    },
})

module.exports = mongoose.model('Questions', questions);