
# Blueprint

## Overview

Recipe Revive is a Flutter application that allows users to find and save recipes. The application will use Firebase for authentication and data storage.

## Features

*   User registration and login
*   Recipe search
*   Recipe saving
*   Theme toggle (light/dark)

## Project Structure

```
.
├── lib
│   ├── main.dart
│   ├── providers
│   │   └── theme_provider.dart
│   ├── router
│   │   └── app_router.dart
│   ├── screens
│   │   ├── login_screen.dart
│   │   ├── recipes_screen.dart
│   │   ├── register_screen.dart
│   │   └── welcome_screen.dart
│   └── widgets
│       └── theme_toggle.dart
├── pubspec.yaml
└── blueprint.md
```

## Current Task

*   Refactor the application to use `provider` for state management and `go_router` for navigation.
*   Implement a theme toggle to switch between light and dark mode.
