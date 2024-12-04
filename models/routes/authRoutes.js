
const express = require('express');
const { signup, login, getUser, deleteUser, updateUser } = require('../controllers/authController');
const authMiddleware = require('../middleware/authMiddleware');
const router = express.Router();

router.post('/signup', signup);
router.post('/login', login);
router.get('/getuser', authMiddleware, getUser);       // Secure the route with authMiddleware
router.delete('/deleteuser', authMiddleware, deleteUser); // Route for deleting the user
router.put('/updateuser', authMiddleware, updateUser);    // Route for updating the user

module.exports = router;
