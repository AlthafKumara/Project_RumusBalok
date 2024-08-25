import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(HitungBalokApp());
}

class HitungBalokApp extends StatefulWidget {
  @override
  _HitungBalokAppState createState() => _HitungBalokAppState();
}

class _HitungBalokAppState extends State<HitungBalokApp> {
  ThemeMode _themeMode = ThemeMode.light; // Default mode adalah terang

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hitung Balok',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      themeMode: _themeMode,
      home: HitungBalokHomePage(toggleTheme: _toggleTheme),
    );
  }
}

class HitungBalokHomePage extends StatefulWidget {
  final VoidCallback toggleTheme;

  HitungBalokHomePage({required this.toggleTheme});

  @override
  _HitungBalokHomePageState createState() => _HitungBalokHomePageState();
}

class _HitungBalokHomePageState extends State<HitungBalokHomePage> {
  final TextEditingController _panjangController = TextEditingController();
  final TextEditingController _lebarController = TextEditingController();
  final TextEditingController _tinggiController = TextEditingController();

  double _volume = 0;
  double _luasPermukaan = 0;
  double _diagonalRuang = 0;
  String _errorMessage = '';

  void _hitung() {
    setState(() {
      final panjang = double.tryParse(_panjangController.text);
      final lebar = double.tryParse(_lebarController.text);
      final tinggi = double.tryParse(_tinggiController.text);

      if (panjang == null ||
          lebar == null ||
          tinggi == null ||
          panjang <= 0 ||
          lebar <= 0 ||
          tinggi <= 0) {
        _errorMessage =
            'Masukkan nilai yang valid dan positif untuk panjang, lebar, dan tinggi.';
        _volume = 0;
        _luasPermukaan = 0;
        _diagonalRuang = 0;
      } else {
        _errorMessage = '';
        _volume = panjang * lebar * tinggi;
        _luasPermukaan =
            2 * (panjang * lebar + panjang * tinggi + lebar * tinggi);
        _diagonalRuang =
            sqrt(panjang * panjang + lebar * lebar + tinggi * tinggi);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade300,
        title: Text(
          'Hitung Volume dan Luas Balok',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: widget.toggleTheme,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(15, 15, 15, 5),
              child: Text('Masukkan Panjang dari balok'),
            ),
            TextField(
              controller: _panjangController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Panjang',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(15, 15, 15, 5),
              child: Text('Masukkan Panjang dari balok'),
            ),
            TextField(
              controller: _lebarController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Lebar',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(15, 15, 15, 5),
              child: Text('Masukkan Panjang dari balok'),
            ),
            TextField(
              controller: _tinggiController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tinggi',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _hitung,
              child: Text('Hitung'),
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.amber),
                  foregroundColor: WidgetStatePropertyAll(Colors.black)),
            ),

            SizedBox(height: 20),

            
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            if (_errorMessage.isEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Volume = $_volume',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Luas Permukaan: $_luasPermukaan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Diagonal Ruang: $_diagonalRuang',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
