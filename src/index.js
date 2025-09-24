// Entry Points
const express = require("express");
const dotenv = require("dotenv");
dotenv.config();
const { Sequelize } = require("sequelize");
const bodyParser = require("body-parser");

const app = express();

app.use(express.json());
app.use(bodyParser.json());

const PORT = process.env.PORT || 3000;

async function start() {
  try {
    await Sequelize.authenticate();
    console.log("DB Connected Successfully");

    app.listen(PORT, () => console.log(`Server listening on ${PORT}`));
  } catch (err) {
    console.error("====Unable to connect to DB=====", err);
  }
}

start();
