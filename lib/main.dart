import 'package:flutter/material.dart';
import 'package:app_drawergmail/gmail_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const Color gmailRed = Color(0xFFD93025);
  static const Color textPrimary = Color(0xFF202124);
  static const Color textSecondary = Color(0xFF5F6368);
  static const Color backgroundGrey = Color(0xFFF6F8FC);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gmail Drawer Demo',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: const ColorScheme.light(
          primary: gmailRed,
          onPrimary: Colors.white,
          onSurface: textPrimary,
        ),
      ),
      home: const HomePage(),
      routes: {'/parametres': (context) => const ParametresPage()},
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: MyApp.textPrimary,
        elevation: 0,
        title: const Text(
          'Gmail',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: MyApp.gmailRed,
          ),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: MyApp.textSecondary),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: const GmailDrawer(),
      body: Container(
        color: MyApp.backgroundGrey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.mail_outline,
                size: 80,
                color: MyApp.textSecondary,
              ),
              const SizedBox(height: 20),
              Text(
                'Aucun nouveau message',
                style: const TextStyle(
                  fontSize: 16,
                  color: MyApp.textSecondary,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class ParametresPage extends StatelessWidget {
  const ParametresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: MyApp.textPrimary,
        elevation: 0,
        title: const Text(
          'Paramètres',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: MyApp.textPrimary,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'Page des paramètres',
          style: TextStyle(color: MyApp.textSecondary),
        ),
      ),
    );
  }
}
