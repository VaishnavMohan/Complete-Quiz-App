const mongoose = require('mongoose');

const scoreSchema = new mongoose.Schema({
    score:{
        type: String,
        required : true,
    },
    
})

module.exports = mongoose.model('Scoremodel', scoreSchema);