var express = require('express');
var bcrypt = require('bcrypt');
var moment = require('moment');
var passport = require('passport');
var userModel = require('../models/user.model');
var restricted = require('../middlewares/restricted');

var router = express.Router();

router.get('/register', (req, res, next) => {
  res.render('vwAccount/Register');
})

router.post('/register', (req, res, next) => {
  var saltRounds = 10;
  var hash = bcrypt.hashSync(req.body.password, saltRounds);
  var dob = moment(req.body.dob, 'DD/MM/YYYY').format('YYYY-MM-DD');

  var entity = req.body;
  entity.f_Password = hash;
  entity.f_DOB = dob;
  entity.f_Permission = 0;

  delete entity.password;
  delete entity.confirm;
  delete entity.dob;

  userModel.add(entity).then(id => {
    res.redirect('/account/login');
  })
})

router.get('/is-available', (req, res, next) => {
  var user = req.query.user;
  userModel.singleByUserName(user).then(rows => {
    if (rows.length > 0)
      res.json(false);
    else res.json(true);
  })
})

router.get('/login', (req, res, next) => {
  res.render('vwAccount/login', {
    layout: false
  });
})

router.post('/login', (req, res, next) => {
  passport.authenticate('local', (err, user, info) => {
    if (err)
      return next(err);

    if (!user) {
      return res.render('vwAccount/login', {
        layout: false,
        err_message: info.message
      })
    }

    var retUrl = req.query.retUrl || '/';
    req.logIn(user, err => {
      if (err)
        return next(err);

      return res.redirect(retUrl);
    });
  })(req, res, next);
})

router.post('/logout', restricted, (req, res, next) => {
  req.logout();
  res.redirect('/account/login');
})

router.get('/profile/:id', restricted, (req, res, next) => {
  var id = req.params.id;
  userModel.single(id).then(rows =>{
    res.render('vwAccount/profile',{error:false,profile:rows});

  }).catch(next);


}),
router.get('/editProfile/:id', restricted, (req, res, next) => {
  var id = req.params.id;
 userModel.single(id).then(rows =>{
     res.render('vwAccount/editProfile',{error:false, editprofile:rows});
 
 }).catch(next);
 
 
 })

 router.post('/editProfile/:id', restricted, (req, res, next) => {
  var id = req.params.id;
 var entity = req.body;
var t = id;
 userModel.update(entity, t).then(id =>
  {
    res.redirect(`/account/profile/${t}`);
  })
 
 
 })



module.exports = router;
