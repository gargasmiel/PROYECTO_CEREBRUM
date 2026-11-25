const express = require("express");

const cors = require("cors");

require("dotenv").config();

const authrouter = require("./routes/authroutes");

const app = express();

app.use(cors());
app.use(express.json());

app.get("/api/health", (req, res) => {
  res.json({ message: "API is running" });
});

app.use("/api/auth", authrouter);

app.use((req, res) => {
  res.status(404).json({ message: "Ruta no encontrada" });
});
const PORT = process.env.PORT || 4000;


app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});