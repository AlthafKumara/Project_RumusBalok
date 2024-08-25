import 'package:flutter/material.dart';

class ScaffoldWidget extends StatefulWidget {
  @override
  State<ScaffoldWidget> createState() => _ScaffoldWidgetState();
}

class _ScaffoldWidgetState extends State<ScaffoldWidget> {
  final TextEditingController _nilaiinputPanjang = TextEditingController();
  final TextEditingController _nilaiinputLebar = TextEditingController();
  final TextEditingController _nilaiinputTinggi = TextEditingController();

  double _volume = 0;
  double _luasPermukaan = 0;
  String _errorMessage = '';

  void _hitung() {
    setState(() {
      final panjang = double.tryParse(_nilaiinputPanjang.text);
      final lebar = double.tryParse(_nilaiinputLebar.text);
      final tinggi = double.tryParse(_nilaiinputTinggi.text);

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
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade300,
        title: Text(
          'Hitung Balok',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(15, 15, 15, 5),
              child: Text('Masukkan Panjang dari balok'),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: TextField(
                controller: _nilaiinputPanjang,
                keyboardType: TextInputType.number,
                obscureText: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        gapPadding: 10,
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(5, 5))),
                    labelText: 'Panjang balok'),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(15, 15, 15, 5),
              child: Text('Masukkan Lebar dari balok'),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: TextField(
                controller: _nilaiinputLebar,
                keyboardType: TextInputType.number,
                obscureText: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        gapPadding: 10,
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(5, 5))),
                    labelText: 'Lebar balok'),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(15, 15, 15, 5),
              child: Text('Masukkan tinggi dari balok'),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: TextField(
                controller: _nilaiinputTinggi,
                keyboardType: TextInputType.number,
                obscureText: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        gapPadding: 10,
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(5, 5))),
                    labelText: 'Tinggi balok'),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: ElevatedButton(
                onPressed: _hitung,
                child: Text(
                  'Tampilkan hasil',
                ),
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.amber)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
             if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            if (_errorMessage.isEmpty) Text('Volume =  $_volume'),
            if (_errorMessage.isEmpty) Text('luas permukaan = $_luasPermukaan')
          ],
        ),
      ),
    );
  }
}
