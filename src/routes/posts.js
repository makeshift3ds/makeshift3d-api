const Router = require('express-promise-router');
const router = new Router();

const db = require('../db');

router.get('/', async (req, res) => {
  const { rows } = await db.query('select * from posts', null);
  res.send(rows);
});

router.get('/:slug', async (req, res) => {
  const { slug } = req.params;
  const { rows } = await db.query('select * from posts where slug = $1', [slug]) || {};
  if (!rows.length) {
    res.sendStatus(404);
  } else {
    res.send(rows[0]);
  }
});

module.exports = router;
