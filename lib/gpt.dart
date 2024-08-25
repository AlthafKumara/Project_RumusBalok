import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(HitungBalokApp());
}

class HitungBalokApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hitung Balok',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: HitungBalokHomePage(),
    );
  }
}

class HitungBalokHomePage extends StatefulWidget {
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
        title: Text('Hitung Volume dan Luas Balok'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              setState(() {
                Theme.of(context).brightness == Brightness.dark
                    ? Theme.of(context).copyWith(brightness: Brightness.light)
                    : Theme.of(context).copyWith(brightness: Brightness.dark);
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _panjangController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Panjang',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _lebarController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Lebar',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
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
                    'Volume: $_volume',
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