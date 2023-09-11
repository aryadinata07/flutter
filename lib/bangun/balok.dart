import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/contoller.dart';

class balok extends StatefulWidget {
  const balok({super.key});

  @override
  State<balok> createState() => _balokState();
}

class _balokState extends State<balok> {
  TextEditingController alas = TextEditingController();
  TextEditingController tinggi = TextEditingController();
  final LuasController luasSegitiga = Get.put(LuasController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Column(
          children: [
            Text(
              'Masukkan Segitiga',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: TextFormField(
                controller: alas,
                decoration: InputDecoration(
                  labelText: 'Alas (cm)',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: TextFormField(
                controller: tinggi,
                decoration: InputDecoration(
                  labelText: 'Tinggi (cm)',
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
                  double alasValue = double.tryParse(alas.text) ?? 0;
                  double tinggiValue = double.tryParse(tinggi.text) ?? 0;

                  // Call the method to calculate the area of the parallelogram
                  luasSegitiga.luasSegitiga(alasValue, tinggiValue);
                },
                child: Text(
                  'Hitung Luas Segitiga',
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
                'Luas Segitiga:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Obx(() => Text(
                    '${luasSegitiga.hasilLuasSegitiga.value} cm²',
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
