package com.nicos.flutterprojectandndk

import android.os.Bundle
import android.util.Log
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    companion object {
        /**
         * Load the C file
         * */
        init {
            System.loadLibrary("message")
        }
    }

    //call method from C file
    private external fun message(): String

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.d("rwererwr", message())
    }
}
