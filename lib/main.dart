import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController arus = TextEditingController();
  TextEditingController hambatan = TextEditingController();

  String hasil = "";

  void hitung() {
    setState(() {
      double i = double.tryParse(arus.text) ?? 0;
      double r = double.tryParse(hambatan.text) ?? 0;

      double v = i * r;

      hasil = "Tegangan = $v Volt";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Menghitung Tegangan"),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "Rumus V = I x R",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(height: 20),
              TextField(
                controller: arus,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Arus (Ampere)",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: hambatan,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Hambatan (Ohm)",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: hitung,
                child: Text("Hitung Tegangan"),
              ),
              SizedBox(height: 20),
              Text(
                hasil,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
