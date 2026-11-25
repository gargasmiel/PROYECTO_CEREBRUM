const bcrypt = require('bcryptjs');
const pool = require('./src/config/db');
equire('dotenv').config();
async function crearUsuarioAdmin() {
  const primer_nombre = process.env.SEED_ADMIN_NOMBRE || 'Administrador';
  const segundo_nombre = process.env.SEED_ADMIN_SEGUNDO_NOMBRE || 'General';
  const primer_apellido = process.env.SEED_ADMIN_APELLIDO || 'CEREBRUM';
  const segundo_apellido = process.env.SEED_ADMIN_SEGUNDO_APELLIDO || 'Sistema';
  const telefono = process.env.SEED_ADMIN_TELEFONO || '0000000000';
  const correo = process.env.SEED_ADMIN_EMAIL || 'admin@cerebrum.com';
  const passwordPlano = process.env.SEED_ADMIN_PASSWORD || 'Admin1234';
  try{
     const [existentes] = await pool.query('SELECT id_usuario FROM usuario WHERE correo = ?', [correo]);

     if (existentes.length > 0){
        console.log(`El usuario ${correo} ya existe. No se crea de nuevo.`);
      process.exit(0);
    
     }
     const passwordEncriptada = await bcrypt.hash(passwordPlano, 10);
     await pool.query(
      'INSERT INTO usuario (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, telefono, correo, contrasena, rol, activo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [primer_nombre,segundo_nombre, primer_apellido, segundo_apellido, telefono, correo, passwordEncriptada, 'admin', 1]
    );
    console.log('Usuario administrador creado con exito:');
    console.log(`  correo:    ${correo}`);
    console.log(`  contrasena: ${passwordPlano} (guardada encriptada en la base de datos)`);
    process.exit(0);
  } catch (error) {
    console.error('Error creando el usuario administrador:', error);
    process.exit(1);
  }
}
crearUsuarioAdmin();