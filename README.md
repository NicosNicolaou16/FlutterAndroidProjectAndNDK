# Flutter Android Project and NDK

[![Linktree](https://img.shields.io/badge/linktree-1de9b6?style=for-the-badge&logo=linktree&logoColor=white)](https://linktr.ee/nicos_nicolaou)
[![Site](https://img.shields.io/badge/Site-blue?style=for-the-badge&label=Web)](https://nicosnicolaou16.github.io/)
[![X](https://img.shields.io/badge/X-%23000000.svg?style=for-the-badge&logo=X&logoColor=white)](https://twitter.com/nicolaou_nicos)
[![LinkedIn](https://img.shields.io/badge/linkedin-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/nicos-nicolaou-a16720aa)
[![Medium](https://img.shields.io/badge/Medium-12100E?style=for-the-badge&logo=medium&logoColor=white)](https://medium.com/@nicosnicolaou)
[![Mastodon](https://img.shields.io/badge/-MASTODON-%232B90D9?style=for-the-badge&logo=mastodon&logoColor=white)](https://androiddev.social/@nicolaou_nicos)
[![Bluesky](https://img.shields.io/badge/Bluesky-0285FF?style=for-the-badge&logo=Bluesky&logoColor=white)](https://bsky.app/profile/nicolaounicos.bsky.social)
[![Dev.to blog](https://img.shields.io/badge/dev.to-0A0A0A?style=for-the-badge&logo=dev.to&logoColor=white)](https://dev.to/nicosnicolaou16)
[![YouTube](https://img.shields.io/badge/YouTube-%23FF0000.svg?style=for-the-badge&logo=YouTube&logoColor=white)](https://www.youtube.com/@nicosnicolaou16)
[![Google Developer Profile](https://img.shields.io/badge/Developer_Profile-blue?style=for-the-badge&label=Google)](https://g.dev/nicolaou_nicos)

A guide and starter project for setting up the **Android NDK (Native Development Kit)** within a Flutter project. This project demonstrates how to communicate between Flutter, Android Native (Kotlin), and C/C++ code using Method Channels.
For communication between Android Native and Flutter, I used a channel (refer to the documentation
for more details). If you need an additional example of using channels, please check my repository
for more information: [ExampleChannelNativeAndroidWithCustomData](https://github.com/NicosNicolaou16/ExampleChannelNativeAndroidWithCustomData).

> [!IMPORTANT]
> NOTE: EXAMPLE FOR ANDROID ONLY. <br />

> [!IMPORTANT]  
> A detailed step-by-step guide is available on Medium!  
> 👉 **[NDK Setup on Android/Flutter Android Project](https://medium.com/@nicosnicolaou/ndk-setup-on-android-flutter-android-project-1571d9a3f5cb)** 👈

> [!IMPORTANT]  
> A similar project for pure Native Android (Kotlin) is also available!  
> 👉 **[AndroidProjectAndNDK](https://github.com/NicosNicolaou16/AndroidProjectAndNDK)** 👈

## 🚀 Setup Steps

### 1. Requirements
* Install the latest **NDK** and **CMake** via the Android Studio SDK Manager (**SDK Tools** tab).

### 2. Native Configuration (C++)
* Create a `cpp` package under `android/app/src/main/`.
* Add your `.cpp` source file and a `CMakeLists.txt` file.

**Example `CMakeLists.txt`:**

```cmake
# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html

# Sets the minimum version of CMake required to build the native library.

cmake_minimum_required(VERSION 3.6.0)

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

### 3. Gradle Integration
Add the following to your module-level `build.gradle.kts`:

```Kotlin
android {

    //Other Gradle Code Here...

    externalNativeBuild {
        cmake {
            path = file("src/main/cpp/CMakeLists.txt")
            version = "4.1.2"
        }
    }
    ndkVersion = "29.0.14206865"

    //Other Gradle Code Here...
}
```

### 4. Implementation (Kotlin)
Load the library and declare the external function:

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

## 🔧 Versioning

- **Flutter SDK:** **3.41.4**
- **Dart Version:** **3.11.1**
- **NDK Version:** **29.0.14206865**
- **CMake Version:** **4.1.2**
- **Native Build Tool:** **CMake 3.10.0+**

## 📚 References & Tutorials

- **NDK Samples:** [android/ndk-samples](https://github.com/android/ndk-samples)
- **Official Documentation:** [Add native code to your project](https://developer.android.com/studio/projects/add-native-code)
- **Tutorial:** [Add native code to your project](https://blog.mindorks.com/getting-started-with-android-ndk-android-tutorial/)
- **Flutter Channels:** [ExampleChannelNativeAndroidWithCustomData](https://github.com/NicosNicolaou16/ExampleChannelNativeAndroidWithCustomData)
- **Community Guide:** [Flutter Platform Channels - Medium](https://medium.com/@shreebhagwat94/flutter-platform-channel-46578d21e69)
- **Flutter Channels:** [Flutter Platform Channels - Medium](https://blog.devgenius.io/use-flutter-screens-in-native-android-app-share-data-among-them-d97d670807a6)

## ⭐ Stargazers

If you find this project useful, please give it a star!  
[Check out the stargazers here](https://github.com/NicosNicolaou16/FlutterAndroidProjectAndNDK/stargazers)

## 🙏 Support & Contributions

This project is maintained for the community. Feedback, bug reports, and feature requests are welcome! Feel free to **open an issue** or submit a **pull request**.
