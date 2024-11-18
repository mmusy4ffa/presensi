import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/halaman_pencatatan.dart';
import 'screen/halaman_riwayat.dart';
import 'screen/pencatatan_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => PencatatanProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Presensi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavExample(),
    );
  }
}

class BottomNavExample extends StatefulWidget {
  @override
  _BottomNavExampleState createState() => _BottomNavExampleState();
}

class _BottomNavExampleState extends State<BottomNavExample> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HalamanPencatatan(),
    HalamanRiwayat(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Presensi'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Pencatatan'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
        ],
      ),
    );
  }
}
