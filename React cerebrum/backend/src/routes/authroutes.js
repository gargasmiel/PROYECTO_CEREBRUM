const express = require('express');

const router = express.Router();

const { login, perfil } = require('../controllers/authcontroller');
const verificartoken = require('../middlewares/verificarToken');
router.post('/login', login );
router.get('/perfil', verificartoken, perfil);
module.exports = router;
