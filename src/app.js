const express = require('express');
const cors = require('cors');
const pageRoutes = require('./routes/pages');
const postRoutes = require('./routes/posts');

const app = express();
app.use(cors());

app.use('/pages', pageRoutes);
app.use('/posts', postRoutes);

module.exports = app;
