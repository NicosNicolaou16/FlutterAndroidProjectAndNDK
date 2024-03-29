package com.nicos.flutterprojectandndk

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    companion object {
        private const val CHANNEL = "NDK"
        private const val METHOD_NAME = "message_method"

        /**
         * Load the C file
         * */
        init {
            System.loadLibrary("message-from-c")
        }
    }

    /**
     * Initialize method from C file
     * */
    private external fun message(): String

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val messenger = flutterEngine.dartExecutor.binaryMessenger
        MethodChannel(messenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method.toString() == METHOD_NAME) {
                result.success(message())
            }
        }
    }
}
