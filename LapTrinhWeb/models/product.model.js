var db = require('../utils/db');
var config = require('../config/default.json');

module.exports = {
  all: () => {
    return db.load('select * from products p join categories c on c.CatID = p.CatID');
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
  }, 
  show:() =>{
    return db.load(`select* from products p join categories c on c.CatID = p.CatID Group by p.CatID DESC limit 5`)
  },
  Top10baiviet:() =>{
    return db.load(`select* from products p join categories c on c.CatID = p.CatID order by p.date DESC limit 10`)
  },
  Top10view:() =>{
    return db.load(`select* from products p join categories c on c.CatID = p.CatID order by p.view DESC limit 10`)
  },
  Top4noibat:() =>{
    return db.load(`select* from products p join categories c on c.CatID = p.CatID order by p.view DESC limit 3`)
  },
  Top10chuyenmuc:() =>{
    return db.load(`select* from products p join categories c on c.CatID = p.CatID group by p.CatID order by p.date DESC limit 10 `)
  },
};
