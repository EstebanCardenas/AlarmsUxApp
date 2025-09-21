import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const name = "MyApp";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (_) => const HomePage(),
        '/notification': (_) => const NotificationPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const platform = MethodChannel('com.example.alarms_android');

  Future<void> _showNotification() async {
    await platform.invokeMethod('showNotification');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: _showNotification,
          child: const Text('Mostrar notificación real'),
        ),
      ),
    );
  }
}

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Página Notificación')),
      body: const Center(child: Text('Abriste desde la notificación')),
    );
  }
}
