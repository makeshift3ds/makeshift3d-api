const request = require('supertest');
const app = require('../app');

const db = require('../db');

describe('/posts route', () => {
  test('should return 200 status code', async () => {
    db.query = jest.fn(() => {
      return { rows: [] };
    });
    const response = await request(app).get('/posts');
    expect(response.statusCode).toBe(200);
    expect(db.query).toHaveBeenCalledTimes(1);
  });

  test('should return an array of objects', async () => {
    const mockResponse = [{ id: 1, slug: 'foobar' }, { id: 2, slug: 'batbaz' }];
    db.query = jest.fn(() => {
      return { rows: mockResponse };
    });
    const response = await request(app).get('/posts');
    expect(response.statusCode).toBe(200);
    expect(response.body).toEqual(mockResponse);
  });
});

describe('/posts/slug route', () => {
  test('should return 200 status code', async () => {
    db.query = jest.fn(() => {
      return { rows: [{}] };
    });
    const response = await request(app).get('/posts/foobar');
    expect(response.statusCode).toBe(200);
    expect(db.query).toHaveBeenCalledTimes(1);
  });

  test('should return the first object', async () => {
    const mockResponse = [{ id: 1, slug: 'foobar' }];
    db.query = jest.fn(() => {
      return { rows: mockResponse };
    });
    const response = await request(app).get('/posts/foobar');
    expect(response.statusCode).toBe(200);
    expect(response.body).toEqual(mockResponse[0]);
  });

  test('should return a 404 when record not found', async () => {
    db.query = jest.fn(() => {
      return { rows: [] };
    });
    const response = await request(app).get('/pages/not_found');
    expect(response.statusCode).toBe(404);
  });
});
