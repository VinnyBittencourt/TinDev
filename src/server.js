const express = require("express"); //Puxando o express
const routes = require("./routes"); // puxando o arquivo routes
const server = express(); // Inicializando o express

server.use(routes); // Rota definida no arquivo routes

server.listen(3333); //Escutando na porta 3333 pelo node ou nodemon
