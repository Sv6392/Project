const mongoose = require('mongoose');
require('dotenv').config();

const connectDB = async () => {
    try {
        await mongoose.connect(process.env.MONGO_URI, {
            useNewUrlParser: true,  // Optional, if you're using an older version of mongoose
            useUnifiedTopology: true,  // Optional, if you're using an older version of mongoose
            // ssl: true,  // Ensure SSL is enabled
            // sslValidate: true,  // Ensure the server's SSL certificate is validated
            // tls: true,  // Use TLS instead of SSL for better security
        });
        console.log('MongoDB connected successfully');
    } catch (error) {
        console.error('Database connection failed:', error);
        process.exit(1);
    }
};

module.exports = connectDB;
