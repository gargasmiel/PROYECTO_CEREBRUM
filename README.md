# CEREBRUM — Plataforma de Refuerzo Académico Ramificado y Gamificado

Plataforma web responsiva de micro-aprendizaje y refuerzo académico estructurado por jerarquía curricular (**Materia → Tema → Subtema → Nivel**), con banco adaptativo por bloques de 30 preguntas, sistema dual de **Créditos** (vidas/intentos) y **Perlas** (recompensas cosméticas), flujo editorial de aprobación de contenidos, soporte multi-academia e historial completo mediante eliminación lógica.

> **Estado del proyecto:** Estandarizado y verificado (Fases 1–5 completadas, BD cargada en vivo y Manuales emitidos) bajo [PLAN_DE_CAMBIOS_CEREBRUM_SSOT.md](PLAN_DE_CAMBIOS_CEREBRUM_SSOT.md).

---

## 1. Roles del Sistema (4 Roles Oficiales)

1. **Administrador (`admin`):** Gestión global de la plataforma, cuentas, academias/licencias, plan base global (4 materias), banco de encuesta diagnóstica global, aprobación editorial y reportes globales. Sesión fija de **8 horas**.
2. **Academia (`academia`):** Institución educativa con panel propio, plan de estudios independiente (`id_academia`), licencias y cupos, asignación `N:M` de profesores a materias, matrícula continua de estudiantes afiliados, aprobación editorial institucional y reportes institucionales. Sesión fija de **8 horas**.
3. **Profesor (`profesor`):** Pertenece a una Academia (`1:N`) y se asigna a materias completas (`N:M`). Crea y edita temas, subtemas, niveles, recursos y preguntas (sujetos a aprobación de `admin` o `academia` en `revision_publicacion`). Sesión sin cierre automático (**Access Token 15m + Refresh Token persistente**).
4. **Estudiante (`estudiante`):** Puede ser **independiente** (`id_academia = NULL`, plan Gratuito con 20 créditos iniciales al verificar correo o plan Premium) o **afiliado** a una Academia (matrícula continua e intentos ilimitados). Sesión sin cierre automático (**Access Token 15m + Refresh Token persistente**).

---

## 2. Stack Tecnológico Oficial (MVP)

* **Frontend:** React 19 + Vite + React Router + Axios + Bootstrap 5 / Bootstrap Icons (Web Responsiva).
* **Backend:** Node.js + Express 5 + JWT (`jsonwebtoken`) + `bcryptjs` (coste `>= 10`) + `mysql2/promise`.
* **Base de Datos:** MySQL 8.x (`cerebrum`, `utf8mb4_unicode_ci`) administrada con **phpMyAdmin**.
* **Diagramación y Modelado:** Visual Paradigm (`Cerebrum.vpp`) + fuentes PlantUML/Mermaid.

### Alcance MVP vs. Fase 2
* **MVP:** Registro/Login por correo y contraseña, verificación de correo, recuperación por enlace o código, encuesta diagnóstica global de 15 preguntas (`4/4/4/3`), jerarquía `Materia -> Tema (intro obligatoria) -> Subtema -> Nivel (pool 30 en 3 bloques de 10, aprobación 8/10)`, créditos persistentes (`20` iniciales, 3 intentos gratis, `-2` desde intento 4+), perlas cosméticas (máx. `21` por nivel), Biblioteca Digital, suscripciones Premium (Mensual/Trimestral/Anual) e Institucional (Academia), pagos por pasarela y transferencia con comprobante, notificaciones in-app.
* **Fase 2 (fuera del MVP):** Anuncios publicitarios, recarga de créditos viendo videos, compra de paquetes de créditos (microtransacciones) y aplicación móvil nativa Android (`.apk`).

---

## 3. Estructura del Repositorio

```text
PROYECTO_CEREBRUM/
├── Base de datos/                  # Scripts SQL (cerebrum_v2.sql, cerebrum_v2_seed.sql) y Diccionario de Datos
├── ComponentesMetodologicos/       # Requerimientos (RF, RNF v2, IEEE830), Metodología, Costos y Normalización
├── Diagramas/S.GENERAL/            # Proyecto Visual Paradigm maestro, exportaciones y fuentes corregidas
├── Manuales/                       # Manual Técnico, Manual de Usuario e Informe de Auditoría Post-Corrección (PDF)
├── mockups/                        # Enlaces de diseño y presentación
├── React cerebrum/                 # Aplicación Web (Monorepo npm: backend + frontend)
│   ├── backend/                    # API REST Node.js + Express 5 + MySQL
│   └── frontend/                   # SPA React 19 + Vite + Bootstrap
├── REcolecciondeINF/               # Encuestas y tabulaciones de investigación
└── PLAN_DE_CAMBIOS_CEREBRUM_SSOT.md# Hoja de ruta maestra SSOT v1.0
```

---

## 4. Instalación y Arranque Local

```bash
# 1. Instalar dependencias de frontend y backend
cd "React cerebrum"
npm run install:all

# 2. Configurar variables de entorno en backend/.env (usar backend/.env.example como plantilla)
# PORT=4000, DB_HOST=localhost, DB_PORT=3306, DB_USER=root, DB_NAME=cerebrum, JWT_SECRET=...

# 3. Cargar Base de datos/cerebrum_v2.sql + cerebrum_v2_seed.sql en MySQL/phpMyAdmin (o ejecutar seeder Node)
npm run seed:backend

# 4. Iniciar backend y frontend en desarrollo
npm run dev:backend
npm run dev:frontend
```

---

## 5. Manuales y Evidencia de Auditoría

* [Manual Técnico (SSOT v1.0)](Manuales/MANUAL_TECNICO_CEREBRUM.docx)
* [Manual de Usuario (4 Roles)](Manuales/MANUAL_DE_USUARIO_CEREBRUM.docx)
* [Informe de Auditoría Integral — Estado Post-Corrección (PDF)](Manuales/Auditoria_Integral_CEREBRUM_POST_CORRECCION.pdf)
* [Diccionario de Datos Maestro (37 Entidades)](Base%20de%20datos/DICCIONARIO_DE_DATOS.md)
