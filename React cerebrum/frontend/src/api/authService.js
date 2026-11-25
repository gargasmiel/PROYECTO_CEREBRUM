import axiosClient from "./axiosClient";

export async function inciarSesion(correo, contraseña) {
    const respuesta = await axiosClient.post ('auht/login', {correo, contraseña});
    return respuesta.data;   
}

export async function obtenerPerfil() {
    const respuesta = await axiosClient.get ('/auth/perfil');
    return respuesta.data; 
    
}