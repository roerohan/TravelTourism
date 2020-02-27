// Connect to MongoDB instance
require('./models/db');

// Require express and ejs
const express = require('express');
const app = express();
let ejs = require('ejs');
const setup = require('./tools/setup');
const Seat = require('./models/seats.model');

var seats = setup.seats;
const mappings = setup.mappings;
const randomize = setup.randomize;

app.use(express.static('public'));
app.set('view engine', 'ejs');

app.get('/trains/:trainNo', (req, res)=>{
    seats = [];
    randomize(seats);
    const trainNo = req.params.trainNo;
    res.render('./table.ejs', {trainNo});
});

app.get('/trains/:trainNo/status', (req, res) => {
    res.json(seats);
})

app.get('/trains/:trainNo/:aNo/:status/mark', (req, res) => {
    const trainNo = req.params.trainNo;
    const aNo = req.params.aNo;
	console.log(aNo);
    const status = req.params.status;
    if (aNo in mappings) {
        seats[mappings[aNo]-1] = status;
        res.send(mappings[aNo].toString());
    } else {
        res.send('invalid');
    }
});

app.get('/passengers', async (req, res) => {
    const a = await Seat.find({});
    res.send(a);
});

app.get('/', (req, res) => {
    res.redirect('/trains/121');
});

app.listen(process.env.PORT || 3000, () => {
    console.log("Server is running");
})
