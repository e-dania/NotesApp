# NotesApp

## Architecture Overview

```
+---------------------+           +------------------------+
|    Login Screen     |  ----->   |   Firebase Auth        |
+---------------------+           +------------------------+
         |                               |
         v                               v
+---------------------+           +------------------------+
|  Notes List Screen  |  <----->  |   Firestore Database   |
+---------------------+           +------------------------+
         |
         v
+---------------------+
|   Add/Edit Note     |
+---------------------+
```

## Build Instructions

### 1. Clone the repository

```bash
git clone https://github.com/e-dania/NotesApp
cd NotesApp
```

### 2. Install Flutter dependencies

```bash
flutter pub get
```

### 3. Set Up Firebase

#### Create Firebase Project

- Go to [Firebase Console](https://console.firebase.google.com/)
- Click **"Add project"** → Follow the setup wizard

#### Register Your App

- In Firebase Console → Project Overview → Click **“Add App”** > Choose **Android**
- Enter your package name (from `android/app/build.gradle.kts`)
- Download `google-services.json`
- Place it in: `android/app/google-services.json`

#### Enable Firebase Authentication

- Firebase Console → **Authentication** → **Sign-in method**
- Enable **Email/Password**

#### Create Firestore Database

- Firebase Console → **Firestore Database**
- Click **Create Database** → Start in **Test Mode** (for development)

### 4. Configure `android/build.gradle.kts`

Ensure the following inside the `buildscript` block:

```kotlin
dependencies {
    classpath("com.google.gms:google-services:4.3.15") // or latest
}
```

### 5. Configure `android/app/build.gradle.kts`

Add this at the bottom of the file:

```kotlin
apply(plugin = "com.google.gms.google-services")
```

Inside the `dependencies` block, include:

```kotlin
implementation("com.google.firebase:firebase-auth:22.3.0")
implementation("com.google.firebase:firebase-firestore:24.11.0")
```

### 6. Run the App

```bash
flutter run
```
