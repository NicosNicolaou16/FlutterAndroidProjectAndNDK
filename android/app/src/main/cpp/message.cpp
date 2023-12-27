#include <jni.h>
#include <string>
#include <cstdio>
#include <android/log.h>

using namespace std;

/**
 * Logs
 * REFERENCE -> https://stackoverflow.com/questions/24646633/how-to-debug-jni-c-file-in-ndk-android
 * */
#define LOG_TAG "AndroidProjectAndNDK"
#define LOGV(...) __android_log_print(ANDROID_LOG_VERBOSE, LOG_TAG, __VA_ARGS__)

extern "C" JNIEXPORT jstring JNICALL
Java_com_nicos_flutterprojectandndk_MainActivity_message(JNIEnv *env, jobject object) {
    string message = "Communicate Android Project with C file";
    LOGV("The value is %s", message.c_str());
    return env->NewStringUTF(message.c_str());
}