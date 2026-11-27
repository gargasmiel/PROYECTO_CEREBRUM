import { useState } from "react";
import { useNavigate } from "react-router-dom";
import { useAuth } from "../context/useAuth";

function loadPage(){
    const { load } = useAuth();
  const navigate = useNavigate();
  const [correo, setEmail] = useState("");
  const [contrasena, setPassword] = useState("");
  const [error, setError] = useState("");
  const [enviado, setEnviado] = useState(false);
  
  async function manejarEnvio(evento){
    evento.preventDefault();
    setError("");
    setEnviado(true);
    try{
        await load(correo,contrasena);
        navigate("/dashboard",{replace: true});
    } catch (err){
        const mensajeBackend = err?.response?.data?.mensaje;
        setError(
            mensajeBackend ||
          "No se pudo conectar con el servidor. Verifica que el backend este corriendo",
      
        );
    } finally {
    }
  }
 return (
    <main className="container min-vh-100 d-flex align-items-center justify-content-center py-4">
      <div className="card shadow-lg border-0 w-100" style={{ maxWidth: 400 }}>
        <div className="card-body p-4 p-md-5">
          <div className="text-center mb-4">
            <i className="bi bi-boxes text-primary" style={{ fontSize: "2.5rem" }}></i>
            <h1 className="h4 mt-2 mb-0">Inventario React</h1>
            <p className="text-muted small">Ingresar con tu cuenta registrada</p>
          </div>

          {error && <div className="alert alert-danger py-2">{error}</div>}

          <form onSubmit={manejarEnvio}>
            <div className="mb-3">
              <label className="form-label" htmlFor="email">
                Correo electronico
              </label>
              <input
                id="email"
                type="email"
                className="form-control"
                placeholder="admin@inventario.com"
                value={email}
                onChange={(evento) => setEmail(evento.target.value)}
                autoComplete="username"
                required
                autoFocus
              />
            </div>

            <div className="mb-3">
              <label className="form-label" htmlFor="password">
                Contrasena
              </label>
              <input
                id="password"
                type="password"
                className="form-control"
                value={password}
                onChange={(evento) => setPassword(evento.target.value)}
                autoComplete="current-password"
                required
              />
            </div>

            <button type="submit" className="btn btn-primary w-100" disabled={enviado}>
              {enviado ? "Enviando..." : "Ingresar"}
            </button>
          </form>
        </div>
      </div>
    </main>
  );
}

export default LoginPage;
