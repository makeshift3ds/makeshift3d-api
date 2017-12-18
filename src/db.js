const { Pool } = require('pg');

const pool = new Pool({
  connectionString: process.env.MAKESHIFT3D_PG_DATABASE
});

module.exports = {
  query: async (text, params) => {
    const res = await pool.query(text, params);
    return res;
  }
};
