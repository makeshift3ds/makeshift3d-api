const request = require('supertest');
const app = require('../app');

describe('pages route', () => {
  test('should work', async () => {
    const response = await request(app).get('/pages');
    expect(response.statusCode).toBe(200);
  });
})