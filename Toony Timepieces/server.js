const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');

const app = express();
const port = 3000;

// Middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// MySQL Connection
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'your_password',
    database: 'toony_timepieces'
});

db.connect((err) => {
    if (err) {
        throw err;
    }
    console.log('MySQL Connected...');
});

// Routes
app.get('/products', (req, res) => {
    let sql = 'SELECT * FROM products';
    db.query(sql, (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

app.post('/order', (req, res) => {
    let order = req.body;
    let sql = 'INSERT INTO orders SET ?';
    db.query(sql, order, (err, result) => {
        if (err) throw err;
        res.json({ orderID: result.insertId, message: 'Order placed successfully' });
    });
});

app.listen(port, () => {
    console.log(`Server started on port ${port}`);
});

const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');

const app = express();
const port = 3000;

// Middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// MySQL Connection
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'your_password',
    database: 'toony_timepieces'
});

db.connect((err) => {
    if (err) {
        throw err;
    }
    console.log('MySQL Connected...');
});

// Routes
app.get('/', (req, res) => {
    res.send('Welcome to Toony Timepieces API');
});

app.post('/register', (req, res) => {
    let user = req.body;
    let sql = 'INSERT INTO users SET ?';
    db.query(sql, user, (err, result) => {
        if (err) throw err;
        res.json({ message: 'User registered successfully' });
    });
});

// Start Server
app.listen(port, () => {
    console.log(`Server started on port ${port}`);
});
