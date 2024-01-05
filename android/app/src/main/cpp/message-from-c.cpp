#include <jni.h>
#include <string>
#include <cstdio>
#include <android/log.h>

using namespace std;

#define LOG_TAG "AndroidProjectAndNDK"
#define LOGV(...) __android_log_print(ANDROID_LOG_VERBOSE, LOG_TAG, __VA_ARGS__)

extern "C" JNIEXPORT jstring JNICALL
Java_com_nicos_flutterprojectandndk_MainActivity_message(JNIEnv *env, jobject object) {
    string message = "Hey Android, sent message from C file";
    LOGV("The value is %s", message.c_str());
    return env->NewStringUTF(message.c_str());
}