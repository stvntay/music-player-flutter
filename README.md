# Music Playlist App

Music Playlist

## Supported Device
- Min SDK : API 21 (Android 5.0 / Lollipop)
- Target Device : API 30 (Android 11)

## Supported Feature
- Get Music List from iTunes 
- Search Music by Artists Name
- Play/Pause Music
- Change Seeker to Define Timeplay

## Requirement to Build App
App is build for minimum SDK API 21.
Recommend to use Flutter version > 2.8.

## How to Build & Deploy App
1. Download the project
2. cd to project file name
3. Run command "flutter doctor -v" to make sure you can run the project
4. Run flutter pub get to download packages from library dependencies
5. Run flutter pub run build_runner build --delete-conflicting-outputs to generate file to coverage json data
6. To build the apk (Android), run "flutter build apk --debug" for debug version or run "flutter build apk --release" for release version
7. Your build location will be in flutter yourfoldername/build/app/outputs/flutter-apk/app-release.apk

You are ready to go!

