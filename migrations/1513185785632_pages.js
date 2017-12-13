exports.up = (pgm) => {
  pgm.createTable('pages',
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

  pgm.addIndex('pages', 'slug', {
    name: 'pages-slug-index',
    unique: true
  });
};
