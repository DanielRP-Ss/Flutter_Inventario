# Inventario App en Flutter
Aplicación móvilde gestión de inventario

Integrantes:
*Daniel Rojas, Malcolm Méndez, Yariel Jiménez*

---

## 1. Requisitos

| Componente | Versión usada |
| --- | --- |
| Flutter SDK | 3.47.9 (canal stable) |
| Android Studio | última estable |
| Android SDK | 36.0.0 |
| NDK (Side by side) | 28.2.13676358 |
| Java | el que trae Android Studio (JBR) |
| Emulador | API 34+ (x86_64) o dispositivo físico con depuración USB |
| SO de desarrollo | Windows 10 o 11 (también compila en Linux/macOS) |

---

## 2. Preparación del entorno (pasos exactos, Windows)

### 2.1 Flutter SDK

1. Descargar Flutter stable desde https://docs.flutter.dev/get-started/install → zip.
2. Extraer en `C:\Users\<usuario>\Flutter` (sin espacios en la ruta).
3. Agregar a PATH: `C:\Users\<usuario>\Flutter\bin`.
4. Verificar:

```bash
flutter doctor
```

### 2.2 Android Studio y SDK

1. Instalar Android Studio.
2. En **Settings → Android SDK → SDK Platforms**: instalar **Android API 36**.
3. En la pestaña **SDK Tools**, marcar e instalar:

- ☑ Android SDK Build-Tools
- ☑ **Android SDK Command-line Tools (latest)**  ← *si falta, `flutter doctor --android-licenses` 
- ☑ **NDK (Side by side) — versión 28.2.13676358**
- ☑ Android Emulator + system image (API 34+, x86_64)

4. Aceptar licencias:

```bash
flutter doctor --android-licenses  
flutter doctor                        # todo debe salir [✓] salvo Visual Studio (no necesario)
```

### 2.3 Dart SDK en Android Studio (al clonar el repo)

Al abrir el proyecto clonado puede aparecer el banner **"Dart SDK is not configured"**. Configurarlo:

```javascript
Settings → Languages & Frameworks → Dart
→ ☑ Enable Dart support
→ Dart SDK path:  C:\Users\<usuario>\Flutter\bin\cache\dart-sdk
→ Apply
```

O simplemente ejecutar `flutter pub get` en la raíz del proyecto: Android Studio auto-detecta el SDK.

### 2.4 Emulador

1. Android Studio → **Device Manager** → Create Device → Pixel (cualquiera) → system image **API 34+ x86_64**.
2. Encender el emulador. **Solo uno a la vez**; si aparece el error `Running multiple emulators with the same AVD`, matar procesos viejos:

```bash
taskkill /F /IM emulator.exe
taskkill /F /IM qemu-system-x86_64.exe
```

---

## 3. Instalación y ejecución del proyecto

```bash
# 1. Clonar
git clone https://github.com/DanielRP-Ss/Flutter_Inventario.git
cd inventario_app

# 2. Dependencias
flutter pub get

# 3. Verificar dispositivos
flutter devices        # debe listar el emulador encendido

# 4. Ejecutar
flutter run -d emulator-5554
```

Alternativas de ejecución (Flutter es multiplataforma por diseño):

```bash
flutter run -d chrome     # en navegador, sin emulador (demo rápida)
flutter run               # menú interactivo para elegir dispositivo
```

Durante la ejecución: `r` = hot reload, `R` = hot restart, `q` = salir.

---

## 4. Estructura del proyecto

```javascript
inventario_app/
├── lib/
│   ├── main.dart                    
│   ├── models/
│   │   └── item.dart                
│   └── screens/
│       ├── lista_screen.dart       
│       └── formulario_screen.dart   
├── android/                         
├── ios/  linux/  macos/  windows/   
├── web/                             
├── test/                           
├── pubspec.yaml                    
└── README.md
```

Archivos relevantes: todo el código de la app vive en `lib/` (Dart); las carpetas
nativas solo se tocan para configuración (permisos, íconos, NDK).

## 5. Datos 

Inicia con 3 productos precargados en `lista_screen.dart`:

| id | nombre | cantidad | categoría |
| --- | --- | --- | --- |
| 1 | Mouse Logitech | 5 | Periféricos |
| 2 | Cable HDMI 2m | 12 | Cables |
| 3 | Teclado mecánico | 3 | Periféricos |

Casos de validación para la demo:

- Guardar vacío → 3 mensajes "Campo obligatorio".
- Cantidad = `abc` o `0` → "Ingrese un número válido mayor a 0".
- Flujo válido → item aparece en la lista + SnackBar.

## 6. Distribución

| Integrante | Rol | Contribución |
| --- | --- | --- |
| Integrante 1 | Investigación y arquitectura | Historia, arquitectura de Flutter, Dart, comparativa con React Native, usos y ventajas |
| Integrante 2 | Entorno y desarrollo base | Instalación, estructura del proyecto, navegación, formulario validado, README, repositorio |
| Integrante 3 | Datos y servicios | Listado dinámico, consumo de API REST, manejo de estado, demo en vivo |

## 7. Limitaciones conocidas

- Datos **en memoria**: al cerrar la app se pierden los agregados (sin persistencia local).
- Sin borrar/editar items ni autenticación.
- La integración con API REST (Django) está en desarrollo por el equipo; el modelo `Item` ya está desacoplado para mapear el JSON del endpoint.
- Compilación para **iOS** requiere macOS con Xcode (no disponible en el equipo de desarrollo).
- Compilación para **Windows desktop** requiere Visual Studio con workload C++ (no instalado, no necesario para la demo).

