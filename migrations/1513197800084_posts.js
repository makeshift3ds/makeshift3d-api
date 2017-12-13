exports.up = (pgm) => {
  pgm.createTable('posts',
    {
      id: 'id',
      slug: {
        type: 'varchar(30)',
        notNull: true,
      },
      title: {
        type: 'varchar(50)',
        notNull: true
      },
      body: {
        type: 'text',
        notNull: true
      },
      tags: {
        type: 'text[]'
      },
      created_at: {
        type: 'timestamp',
        notNull: true
      },
      updated_at: {
        type: 'timestamp',
        notNull: true
      }
    }
  );

  pgm.addIndex('posts', 'slug', {
    name: 'posts-slug-index',
    unique: true
  });
};