const express = require('express');
const app = express();
const dotenv = require('dotenv');
const mongoose = require('mongoose');
const path = require('path');

const authRoute = require('./routes/auth');
const quesRoute = require('./routes/ques');
const scoreRoute = require('./routes/score')

// const bodyParser = require('body-parser');
// const postRoute = require('./routes/posts');
require('dotenv').config({ path: path.resolve(__dirname, './routes/.env') });
dotenv.config();


mongoose.connect(
    process.env.DB_CONNECT,
    { useNewUrlParser: true, useUnifiedTopology: true },
()=> console.log('Connected to db'));

// app.use(bodyParser.json());

app.use(express.json());


app.use('/api/user', authRoute);
app.use('/api/user', quesRoute);
app.use('/api/user', scoreRoute);
// app.use('/api/post', postRoute);

app.listen(3000, () => console.log('Server Up'));

