# Flutter Android Project and NDK

This project is just the setup for the NDK in android, the communication Android project with C/C++
file. In this
example we print only a text from C/C++ file to Android Project.

NOTE: EXAMPLE ONLY FOR ANDROID

## Similar project with (Kotlin Language)
https://github.com/NicosNicolaou16/AndroidProjectAndNDK <br />

## Versions
Flutter SDK version: 3.16.5 <br />
Dart Version: 3.2.3 <br />

# Setup - Steps

- Install the latest NDK and CMake version from Android Studio SDK Manager from the SDK Tools
  section.
- Create the cpp package, add the CMake .txt and .cpp file.
- Add the follow code in Gradle file.

```Kotlin
android {

    //Other Gradle Code Here...

    externalNativeBuild {
        cmake {
            path = file("src/main/cpp/CMakeLists.txt")
            version = "3.22.1"
        }
    }
    ndkVersion = "26.1.10909125"

    //Other Gradle Code Here...
}
```

- Load the C/C++ file.

```Kotlin
companion object {
    /**
     * Load the C file
     * */
    init {
        System.loadLibrary("message")
    }
}
```

- Call the method(s) from .cpp file.

```Kotlin
private external fun message(): String 
```

# References/Tutorials Follow

https://blog.mindorks.com/getting-started-with-android-ndk-android-tutorial/ <br />
https://developer.android.com/studio/projects/add-native-code <br />
https://github.com/android/ndk-samples <br />
https://medium.com/@shreebhagwat94/flutter-platform-channel-46578d21e69 <br />
https://blog.devgenius.io/use-flutter-screens-in-native-android-app-share-data-among-them-d97d670807a6 <br />
