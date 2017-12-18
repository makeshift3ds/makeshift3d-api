const Router = require('express-promise-router');
const showdown = require('showdown');

const router = new Router();
const markdownConverter = new showdown.Converter();

const db = require('../db');

router.get('/', async (req, res) => {
  const { rows } = await db.query('select * from pages', null);
  res.send(rows);
});

router.get('/:slug', async (req, res) => {
  const { slug } = req.params;
  const { rows } = await db.query('select * from pages where slug = $1', [slug]);
  if (!rows.length) {
    res.sendStatus(404);
  } else {
    const page = rows[0];
    page.body = markdownConverter.makeHtml(page.body);
    res.send(page);
  }
});

module.exports = router;
