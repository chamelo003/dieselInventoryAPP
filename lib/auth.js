// Este modulo es el guachi que vigila que esté loggeado el usuario

module.exports = {
    isLoggedIn (req, res, next) {
        if (req.isAuthenticated()) {
            return next();
        }
        return res.redirect('/');
    }
}; 