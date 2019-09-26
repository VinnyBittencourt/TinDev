const express = require("express");

const routes = express.Router();

// 4 Verbos GET, SET, PUT, DELETE
//Metodo GET
routes.get("/", (req, res) => {
  return res.send({ message: `Olá ${req.query.name}` });
});

routes.post("/devs", (req, res) => {
  return res.json({ ok: true });
});

module.exports = routes;
