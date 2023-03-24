import 'package:flutter/material.dart';

String _appEntrypoint = "";
String _appVersion = "";
void main() {
  const appEntrypoint = bool.hasEnvironment("APPENTRYPOINT")
      ? String.fromEnvironment("APPENTRYPOINT")
      : null;
  _appEntrypoint = appEntrypoint ?? "";

  const appVersion = bool.hasEnvironment("APPVERSION")
      ? String.fromEnvironment("APPVERSION")
      : null;
  _appVersion = appVersion ?? "";

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Entrypoint:$_appEntrypoint",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              "Version:$_appVersion",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
    );
  }
}
