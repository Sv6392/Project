

// const express = require('express');
// const {
//     createCategory,
//     getCategories,
//     getCategoryById,
//     updateCategory,
//     deleteCategory,
// } = require('../controllers/categoryController');
// const authMiddleware = require('../middleware/authMiddleware');
// const router = express.Router();

// router.post('/create', authMiddleware, createCategory);
// router.get('/', authMiddleware, getCategories);          // Get all categories
// router.get('/:id', authMiddleware, getCategoryById);     // Get a single category by ID
// router.put('/:id', authMiddleware, updateCategory);      // Update a category by ID
// router.delete('/:id', authMiddleware, deleteCategory);   // Delete a category by ID

// module.exports = router;


const express = require('express');
const categoryController = require('../controllers/categoryController');
const authMiddleware = require('../middleware/authMiddleware');

const router = express.Router();

router.post('/creteCategories', authMiddleware, categoryController.createCategory);
router.get('/grtAllCategories', categoryController.getCategories);
router.get('/grtCategories/:id', categoryController.getCategoryById);
router.put('/updateCategories/:id', authMiddleware, categoryController.updateCategory);
router.delete('/deleteCategories/:id', authMiddleware, categoryController.deleteCategory);

module.exports = router;
