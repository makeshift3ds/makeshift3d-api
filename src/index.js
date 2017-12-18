/* eslint no-console: 0 */
const http = require('http');
const chalk = require('chalk');

/* App Dependencies */
const app = require('./app');

/* Configs */
const port = process.env.port || 3000;

/* Setups */
const server = http.createServer(app);

// catch unhandled rejects
process.on('unhandledRejection', (e) => {
  console.log(chalk.red('[ERROR] Unhandled Rejection'), e.message, e.stack);
});

server.listen(port, () => {
  console.log(chalk.blue(`[STATUS] Listening on port : ${port}`));
});
