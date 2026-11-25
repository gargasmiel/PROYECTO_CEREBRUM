const bcrypt = require('bcryptjs');
const jwt =require('jsonwebtoken');
const pool = require('../config/db');
require('dotenv').config();

async function login(req, res) {
    try{
        const {correo, contrasena } = req.body;
        if(!correo||!contrasena){
            return res.status(400).json
            ({mensaje:'el correo y la contraseña son obligatorios'});
        }
        const [filas] = await pool.query(
            'SELECT id_usuario, primer_nombre, correo, contrasena, rol, activo from usuario WHERE correo = ? LIMIT 1',
            [correo]
        );
        if (filas.length ===0){
            return res.status(401).json({
                mensaje:'correo o contraseña incorrectos'
            });
        }
        const usuario = filas[0];
        if (Number(usuario.activo) === 0) {
            return res.status(403).json({
                mensaje:'este usuario esta desactivado; contacte al administrador '
            });
        }
        const contrasenacorrecta = await bcrypt.compare (contrasena, usuario.contrasena);
        if(!contrasenacorrecta){
            return res.status(401).json({
                mensaje:'correo o incorrectos'
            });
        }
        const token = jwt.sign(
            {id: usuario.id_cliente, correo: usuario.correo, rol: usuario.rol},
            process.env.JWT_SECRET,
            {expiresIn: process.env.JWT_EXPIRES_IN || '8H'}
        );

        return res.json({
            token, 
            usuario:{
                nombre: usuario.primer_nombre,
                correo: usuario.correo,
                rol: usuario.rol,
            },
        });
        
    }
    catch (error){
        console.error('error login:', error);
        return res.status(500).json({mensaje: 'error del servidor al iniciar sesion'});
    }   
}
async function perfil(req, res) {
    return res.json({usuario:req.usuario});
}

module.exports = {login, perfil};