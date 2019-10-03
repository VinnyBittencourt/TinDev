const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");

const routes = require("./routes");

const server = express();

mongoose.connect(
  "mongodb+srv://vinny:apolo100@cluster0-zqxts.mongodb.net/tindev?retryWrites=true&w=majority",
  { useNewUrlParser: true, useUnifiedTopology: true }
);

server.use(cors());
server.use(express.json());
server.use(routes);

server.listen(3333);
