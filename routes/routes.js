var path = require('path')
var routes = {
    main: function(req, res) {
        res.sendfile(path.join(__dirname, '../public/index.html'));
    }
};

module.exports = routes;