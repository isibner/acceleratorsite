var path = require('path');
var mongo = require('mongoskin');
var db = mongo.db('mongodb://localhost:27017/test', {safe: true});
var routes = {
    main: function(req, res) {
        res.sendfile(path.join(__dirname, '../public/index.html'));
    },
    new_app: function(req, res) {
        db.collection('apps').insert(req.body, {w:1}, function(err, data){
            if(err)
                res.send({error: true});
            else
                res.send({success: true});
        });
    },
    get_admin: function(req, res){
        res.sendfile(path.join(__dirname, '../public/admin.html'));
    },
    post_admin : function(req, res){
        if(req.body.secret === process.env.secret_key){
            db.collection('apps').find({}).toArray(function(err, data){
                if(err)
                    res.send({error: true});
                else
                    res.send(data);
            });
        }
        else
            res.redirect('/admin');
    },
    apply : function(req, res){
        res.sendfile(path.join(__dirname, '../public/apply.html'));
    },
    join : function(req, res) {
        res.redirect('/apply');
    }
};

module.exports = routes;