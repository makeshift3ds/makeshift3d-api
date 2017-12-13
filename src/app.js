const express = require('express');
const pageRoutes = require('./routes/pages');

const app = express();

app.use('/pages', pageRoutes);

module.exports = app;
