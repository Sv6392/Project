
const Category = require('../models/Category');

// POST - Create a new category
exports.createCategory = async (req, res) => {
    try {
        const { name, status } = req.body;
        console.log(req.body, "body")
        const category = new Category({
            name,
            status,
            createdBy: req.user.userId,
        });
        await category.save();
        res.status(201).json(category);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// GET - Get all categories
exports.getCategories = async (req, res) => {
    try {
        const categories = await Category.find();
        res.json(categories);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// GET - Get a single category by ID
exports.getCategoryById = async (req, res) => {
    try {
        const { id } = req.params;
        const category = await Category.findById(id);
        if (!category) {
            return res.status(404).json({ message: 'Category not found' });
        }
        res.json(category);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// PUT - Update a category by ID
exports.updateCategory = async (req, res) => {
    try {
        const { id } = req.params;
        const { name, status } = req.body;
        const category = await Category.findByIdAndUpdate(
            id,
            { name, status },
            { new: true }
        );
        if (!category) {
            return res.status(404).json({ message: 'Category not found' });
        }
        res.json(category);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// DELETE - Delete a category by ID
exports.deleteCategory = async (req, res) => {
    try {
        const { id } = req.params;
        const category = await Category.findByIdAndDelete(id);
        if (!category) {
            return res.status(404).json({ message: 'Category not found' });
        }
        res.json({ message: 'Category deleted successfully' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};
