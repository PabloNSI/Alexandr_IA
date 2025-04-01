# 📚 README - Alexandr.IA: Gestión Básica de Biblioteca Personal  

## 📌 Descripción del Proyecto  
**Alexandr.IA** es una aplicación Flutter que implementa:  

### Funcionalidades Implementadas (en código)  
- **CRUD completo de libros**:  
  - Creación/edición con título, categoría y página actual  
  - Almacenamiento local
- **Sistema de autenticación**:  
  - Login básico con email y contraseña  
  - Persistencia de sesión  
- **Interfaz adaptable**:  
  - Modo claro/oscuro configurable  
  - Diseño responsivo para móviles  

### ⚙️ Tecnologías Usadas
| Componente       | Tecnología | Versión |
|:-----------------|:----------:|--------:|
| Frontend         | Flutter    | 3.13    |
| Gestión de Estado| Provider   | 6.0     |

### 🚀 Instalación
flutter --version  # ≥ 3.0.0  
dart --version     # ≥ 2.17.0  

Ejecutar:
git clone https://github.com/PabloNSI/Alexandr_IA.git  
cd Alexandr_IA  
flutter pub get  
flutter run  

### Estructura del Código  
```bash
📦 lib/
├── 📂 models/
│   ├── book.dart        # Modelo Libro (título, categoría, página)
│   └── user.dart        # Modelo Usuario (email, contraseña hasheada)
├── 📂 services/
│   ├── db_helper.dart   # Gestión de SQLite
│   └── auth_service.dart # Lógica de autenticación
└── 📂 screens/
    ├── home_screen.dart # Listado de libros
    └── edit_book.dart   # Formulario CRUD
