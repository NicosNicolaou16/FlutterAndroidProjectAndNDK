# Flutter Android Project and NDK

This project sets up the NDK (Native Development Kit) in Android for communication between an
Android project and C/C++ code. In this example, the C/C++ code simply prints a text message to the
Android application. <br />
For communication between Android Native and Flutter, I used a channel (refer to the documentation
for more details). If you need an additional example of using channels, please check my repository
for more information: [ExampleChannelNativeAndroidWithCustomData](https://github.com/NicosNicolaou16/ExampleChannelNativeAndroidWithCustomData).

> [!IMPORTANT]
> NOTE: EXAMPLE FOR ANDROID ONLY. <br />

# Setup - Steps

- Install the latest NDK and CMake version from Android Studio SDK Manager from the SDK Tools
  section.
- Create the cpp package, add the CMake .txt and .cpp file. Some name below is base on .cpp file
  name.

```cmake
# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html

# Sets the minimum version of CMake required to build the native library.

cmake_minimum_required(VERSION 3.4.1)

# Creates and names a library, sets it as either STATIC
# or SHARED, and provides the relative paths to its source code.
# You can define multiple libraries, and CMake builds them for you.
# Gradle automatically packages shared libraries with your APK.

add_library( # Sets the name of the library.
        message # based on .cpp file name

        # Sets the library as a shared library.
        SHARED

        # Provides a relative path to your source file(s).
        message.cpp) # based on .cpp file name

# Searches for a specified prebuilt library and stores the path as a
# variable. Because CMake includes system libraries in the search path by
# default, you only need to specify the name of the public NDK library
# you want to add. CMake verifies that the library exists before
# completing its build.

find_library( # Sets the name of the path variable.
        log-lib

        # Specifies the name of the NDK library that
        # you want CMake to locate.
        log)

# Specifies libraries CMake should link to your target library. You
# can link multiple libraries, such as libraries you define in this
# build script, prebuilt third-party libraries, or system libraries.

target_link_libraries( # Specifies the target library.
        message # based on .cpp file name

        # Links the target library to the log library
        # included in the NDK.
        ${log-lib})
```

- Add the follow code in Gradle file.

```Kotlin
android {

    //Other Gradle Code Here...

    externalNativeBuild {
        cmake {
            path = file("src/main/cpp/CMakeLists.txt")
            version = "3.31.5"
        }
    }
    ndkVersion = "27.2.12479018"

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

- Initialize the method(s) from .cpp file.

```Kotlin
private external fun message(): String 
```

> [!IMPORTANT]  
> Check my article :point_right: [NDK Setup on Android/Flutter Android Project - Medium](https://medium.com/@nicosnicolaou/ndk-setup-on-android-flutter-android-project-1571d9a3f5cb) :point_left: <br />

> [!IMPORTANT]  
> Similar project with (Kotlin Language) :point_right: [AndroidProjectAndNDK](https://github.com/NicosNicolaou16/AndroidProjectAndNDK) :point_left: <br />

## Versioning

Flutter SDK version: 3.27.3 <br />
Dart Version: 3.6.1 <br />

# References/Tutorials Follow

https://github.com/android/ndk-samples <br />
https://developer.android.com/studio/projects/add-native-code <br />
https://blog.mindorks.com/getting-started-with-android-ndk-android-tutorial/ <br />
https://medium.com/@shreebhagwat94/flutter-platform-channel-46578d21e69 <br />
https://blog.devgenius.io/use-flutter-screens-in-native-android-app-share-data-among-them-d97d670807a6 <br />
