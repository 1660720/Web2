var db = require('../utils/db');
var config = require('../config/default.json');

module.exports = {
  all: () => {
    return db.load('select * from products');
  },

  allByCat: catId => {
    return db.load(`select * from products where CatID = ${catId}`);
  },

  countByCat: catId => {
    return db.load(`select count(*) as total from products where CatID = ${catId}`);
  },

  pageByCat: (catId, start_offset) => {
    var lim = config.paginate.default;
    return db.load(`select * from products where CatID = ${catId} limit ${lim} offset ${start_offset}`);
  },

  single: id => {
    return db.load(`select * from products where ProID = ${id}`);
  },

  add: entity => {
    return db.add('products', entity);
  },

  update: entity => {
    var id = entity.ProID;
    delete entity.ProID;
    return db.update('products', 'ProID', entity, id);
  },

  delete: id => {
    return db.delete('products', 'ProID', id);
  }
};
