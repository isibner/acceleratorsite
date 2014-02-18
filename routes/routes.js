var getMain = function(req, res) {
    console.log("I change automagically")
    res.render('test_translated');
};

var routes = {
    main: getMain
};

module.exports = routes;