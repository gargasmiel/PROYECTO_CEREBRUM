import { useState } from "react";
import AuthContext from "./AuthContext";
import { iniciarSesion } from "../api/authService";

function cargarUsuarioGuardado() {
    const usuarioGuardado = localStorage.getItem('usuario');
    const tokenGuardado = localStorage.getItem('token');
    if (!usuarioGuardado || !tokenGuardado){
        return null;
    }
    try {
        return JSON.parse(usuarioGuardado);
    }
    catch (error){
        console.error("No se restaurar la sesion guardada", error);
        localStorage.removeItem("usuario");
        localStorage.removeItem("token");
    return null;
    }
}

export function AuthProvider({ children }){
    const [usuario, setUsuario] = useState(cargarUsuarioGuardado);
    async function login(correo, contrasena){
        const sesion = await iniciarSesion(correo, contrasena);
        localStorage.setItem("token", sesion.token);
        localStorage.setItem("usuario", JSON.stringify(sesion.usuario));
    setUsuario(sesion.usuario);
    }
    function cerrarSesion() {
    localStorage.removeItem("token");
    localStorage.removeItem("usuario");
    setUsuario(null);
  }
  return (
    <AuthContext.Provider value={{ usuario, login, cerrarSesion }}>
      {children}
    </AuthContext.Provider>
  );

}
