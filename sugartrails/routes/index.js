var request = require('request');
var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Sugar Trails', main:'app'});
});

router.get('/app', function(req, res, next) {
  res.render('app');
});

module.exports = router;