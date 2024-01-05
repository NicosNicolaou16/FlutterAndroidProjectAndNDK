import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final MethodChannel _methodChannel = const MethodChannel('NDK');
  static const String _methodName = "message_method";
  String? _valueFromNative;

  callCMethod() async {
    await _methodChannel.invokeMethod(_methodName).then((value) {
      setState(() {
        _valueFromNative = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter NDK Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.white10,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                _valueFromNative ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await callCMethod();
              },
              child: const Text("Click Here"),
            ),
          ],
        ),
      ),
    );
  }
}
