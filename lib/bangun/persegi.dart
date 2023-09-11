import 'package:flutter/material.dart';
import 'package:tugas_rumus_3/controller/contoller.dart';
import 'package:get/get.dart';

class persegi extends StatefulWidget {
  const persegi({super.key});

  @override
  State<persegi> createState() => _persegiState();
}

class _persegiState extends State<persegi> {
  TextEditingController sisi = TextEditingController();
  final LuasController luasPersegi = Get.put(LuasController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Column(
          children: [
            Text(
              'Masukkan ukuran Persegi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: TextFormField(
                controller: sisi,
                decoration: InputDecoration(
                  labelText: 'Sisi (cm)',
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
                  double sisiValue = double.tryParse(sisi.text) ?? 0;
                  luasPersegi.luasSegiempat(sisiValue);
                },
                child: Text(
                  'Hitung Luas Persegi',
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
                'Luas Persegi:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Obx(() => Text(
                    '${luasPersegi.hasilLuasSegiempat.value} cm',
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
