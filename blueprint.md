# Recipe Revive Blueprint

## Descripción General

Recipe Revive es una aplicación móvil construida con Flutter que permite a los usuarios registrarse, iniciar sesión y explorar una lista de recetas. La aplicación presenta una interfaz de usuario limpia y moderna, con un diseño intuitivo y fácil de usar.

## Estructura del Proyecto

El proyecto sigue una estructura simple, con las pantallas principales ubicadas en el directorio `lib/screens`.

```
lib/
├── main.dart               # Punto de entrada de la aplicación y configuración de rutas
└── screens/
    ├── login_screen.dart       # Pantalla de inicio de sesión
    ├── recipes_screen.dart     # Pantalla de lista de recetas
    ├── register_screen.dart    # Pantalla de registro
    └── welcome_screen.dart     # Pantalla de bienvenida
```

## Cambios Recientes

En esta sesión, se realizaron los siguientes cambios para cumplir con la solicitud del usuario de no utilizar temas universales:

*   Se eliminaron los archivos `lib/app.dart` y `lib/theme.dart`.
*   Se restauró `lib/main.dart` para que contenga el `MaterialApp` y la configuración de `GoRouter`.
*   Se movieron todos los estilos y colores específicos a cada archivo de pantalla correspondiente (`welcome_screen.dart`, `login_screen.dart`, `register_screen.dart` y `recipes_screen.dart`).

Este enfoque asegura que cada pantalla sea independiente y no dependa de un tema centralizado, como se solicitó.
