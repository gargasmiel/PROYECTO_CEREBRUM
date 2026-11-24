const jwt = require('jsonwebtoken');
require('dotenv').config();
function  verificarToken(req, res, next){
    const authHeader = req.headers.authorization;
     if(!authHeader){
        return res.status(401).json({mensaje:'No se envio un token de auntenticacion'})
    }
     const [scheme, token, ...extraParts] = authHeader.split(' ');
     if (scheme?.toLowerCase() !== 'bearer' || !token || extraParts.length > 0) {
        return res.status(401).json({mensaje: 'formato de token invalido'});
    }

    try{
        //jwt.verify valida la firma del token con el mismo secrto que uso para crearlo(JWT_SECRET) y revisa que haya expirado 
        const datosUsuario = jwt.verify (token, process.env.JWT_SECRET);
req.usuario = datosUsuario;
  next();
    }
    catch(error){
    return res.status(401).json({mensaje:'Token invalido o expirado'});
    }
}


module.exports = verificarToken;
