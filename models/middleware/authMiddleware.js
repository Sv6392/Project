// const jwt = require('jsonwebtoken');

// const authMiddleware = (req, res, next) => {
//     const token = req.header('Authorization')?.split(' ')[1];
//     if (!token) return res.status(401).json({ message: 'Access denied' });

//     try {
//         const decoded = jwt.verify(token, process.env.JWT_SECRET);
//         req.user = decoded;
//         next();
//     } catch (error) {
//         res.status(400).json({ message: 'Invalid token' });
//     }
// };

// module.exports = authMiddleware;
// authMiddleware.js
const jwt = require('jsonwebtoken');

const authMiddleware = (req, res, next) => {
    console.log("hello")
    const authHeader = req.headers.authorization;
    console.log(authHeader, "header");
    if (!authHeader || !authHeader.startsWith('Bearer ')) {
        return res.status(401).json({ message: 'Authorization header missing or invalid' });
    }

    const token = authHeader.split(' ')[1];
    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        req.user = decoded; // Attach decoded token payload (e.g., userId) to req.user
        next();
    } catch (error) {
        return res.status(401).json({ message: 'Token is invalid or expired' });
    }
};

module.exports = authMiddleware;
