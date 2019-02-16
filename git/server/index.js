console.log('welcome node server ');

/*
const http = require('http');

const hostname = '127.0.0.1';
const port = 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello, World!\n');
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
})
*/

const path = require('path');
const fs = require('fs');
const multer = require('multer');
// const mysql  = require('mysql');
const express = require('express');
// var router = express.Router();
var app = express();
var bodyParser = require('body-parser');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());


// const PORT = process.env.PORT || 3000; 
const port = 3000;
const cors = require('cors');
// app.use(cors())
app.use(cors({ origin: "http://localhost:4200", credentials: true }));

// routes setUp
const api = require('./routes/api');
const file = require('./routes/fileUpload');
var fileRoutes = require('./file.js');

var connection = require('./db.js');


// view engine setup
// app.set('views', path.join(__dirname, 'views'));
// app.set('view engine', 'hbs');
// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
// app.use(logger('dev'));
// app.use(cookieParser());
// app.use(express.static(path.join(__dirname, 'public')));


//Router checking in router file and calling apis
app.use('/api', api);
app.use('/fileUpload', file);
app.use('/file', fileRoutes);
// app.use(express.static('uploads'));
app.use('/uploads', express.static('uploads'))
// app.use('/uploads', express.static(path.join(__dirname, 'uploads')));










//checking
app.get('/', (req, res, next) => res.send('Hello World!'));

//Get user
app.get('/users', (req, res) => {
    connection.query('SELECT * FROM user', (err, rows, fields) => {
        if (!err)
            res.send(rows);
        else
            console.log(err);
    })
});


//Get a user
app.get('/users/:id', (req, res) => {
    connection.query('SELECT * FROM user WHERE user_id = ?', [req.params.id], (err, rows, fields) => {
        if (!err)
            res.send(rows);
        else
            console.log(err);
    })
});



//Delete a user
app.delete('/users/:id', (req, res) => {
    connection.query('DELETE FROM user WHERE user_id = ?', [req.params.id], (err, rows, fields) => {
        if (!err)
            res.send('User DELETED successfully');
        else
            console.log(err);
    })
});



//Insert  user
app.post('/users', (req, res) => {
    let usr = req.body;
    var sql = "SET @user_id = ?; @username = ?; @firstname = ?; @lastname = ?; \
    CALL userAddEdit(@user_id, @username, @firstname, @lastname);";
    connection.query(sql, [usr.user_id, usr.username, usr.firstname, usr.lastname], (err, rows, fields) => {
        if (!err)
            rows.forEach(element => {
                if (element.constructor == Array)
                    res.send('Inserted employee id :' + element[0].user_id);
            });
        else
            console.log(err);
    })
});



//Update  user
app.put('/users', (req, res) => {
    let usr = req.body;
    var sql = "SET @user_id = ?; @username = ?; @firstname = ?; @lastname = ?; \
    CALL userAddOrEdit(@user_id, @username, @firstname, @lastname);";
    connection.query(sql, [usr.user_id, usr.username, usr.firstname, usr.lastname], (err, rows, fields) => {
        if (!err)
            res.send('Updated successfully');
        else
            console.log(err);
    })
});



app.listen(port, () => console.log(`Node app listening on port ${port}!`));










// Code Ends









