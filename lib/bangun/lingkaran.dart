import 'package:flutter/material.dart';
import 'package:tugas_rumus_3/controller/contoller.dart';
import 'package:get/get.dart';

class lingkaran extends StatefulWidget {
  const lingkaran({super.key});

  @override
  State<lingkaran> createState() => _lingkaranState();
}

class _lingkaranState extends State<lingkaran> {
  TextEditingController jari = TextEditingController();
  final LuasController luasLingkaran = Get.put(LuasController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Column(
          children: [
            Text(
              'Masukkan ukuran Lingkaran',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: TextFormField(
                controller: jari,
                decoration: InputDecoration(
                  labelText: 'Jari Jari (cm)',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 100)),
                onPressed: () {
                  double jariValue = double.tryParse(jari.text) ?? 0;
                  luasLingkaran.luasLingkaran(jariValue);
                },
                child: Text(
                  'Hitung Luas Lingkaran',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text(
                'Luas Lingkaran:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Obx(() => Text(
                    '${luasLingkaran.hasilLuasLingkaran.value} cm',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
