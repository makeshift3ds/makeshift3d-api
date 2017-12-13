const { Pool } = require('pg');
const chalk = require('chalk');

const pool = new Pool({
  connectionString: process.env.MAKESHIFT3D_PG_DATABASE
});

module.exports = {
  query: (text, params, callback) => {
    // start a timer on the query
    const start = Date.now();
    return pool.query(text, params, (err, res) => {
      const duration = Date.now() - start;
      console.log(chalk.green('[DB] executed query', { text, duration, rows: res.rowCount }));
      callback(err, res);
    });
  },
  getClient: (callback) => {
    pool.connect((err, client, done) => {
      const query = client.query.bind(client);

      // keep track of the last query
      client.query = () => {
        client.lastQuery = arguments;
        client.query.apply(client, arguments);
      }

      // report requests that take longer than 5 seconds
      const timeout = setTimeout(() => {
        console.error(chalk.red('[DB] a connection has been maintained for more than 5 seconds.'));
        console.error(chalk.red(`[DB] last query executed: ${client.lastQuery}`));
      }, 5000);

      // clear query
      const release = (err) => {
        done(err);
        clearTimeout(timeout);
        client.query = query;
      }

      callback(err, client, done);
    });
  }
}