import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedMenu = 'Selamat Datang di Halaman Utama';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Menu'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                selectedMenu = value;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$value dipilih')),
              );
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'Home', child: Text('Home')),
              const PopupMenuItem(value: 'Profil', child: Text('Profil')),
              const PopupMenuItem(
                  value: 'Tentang Aplikasi', child: Text('Tentang Aplikasi')),
            ],
          )
        ],
      ),
      body: Center(
        child: Text(
          selectedMenu,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
