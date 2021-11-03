var express = require('express');
var bodyParser = require('body-parser');
var path = require('path');
const fs = require('fs');

const contract = JSON.parse(fs.readFileSync('./build/contracts/Migrations.json', 'utf8'));
const contabi=JSON.stringify(contract.abi);

var app = express();
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'public/views'));
app.use(express.static(path.join(__dirname,'public')));


app.use(bodyParser.json()); // support json encoded bodies
app.use(bodyParser.urlencoded({ extended: true })); 
app.get('/', function (req, res) {
	res.render("index",{contabi})
})

app.listen(8000,"localhost");