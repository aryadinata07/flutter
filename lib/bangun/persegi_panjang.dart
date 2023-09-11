import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_rumus_3/controller/contoller.dart';

class persegiPanjang extends StatefulWidget {
  const persegiPanjang({super.key});

  @override
  State<persegiPanjang> createState() => _persegiPanjangState();
}

class _persegiPanjangState extends State<persegiPanjang> {
  TextEditingController panjang = TextEditingController();
  TextEditingController lebar = TextEditingController();
  final LuasController luasPersegiPanjang = Get.put(LuasController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Column(
          children: [
            Text(
              'Masukkan ukuran Persegi Panjang',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: TextFormField(
                controller: panjang,
                decoration: InputDecoration(
                  labelText: 'Panjang (cm)',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: TextFormField(
                controller: lebar,
                decoration: InputDecoration(
                  labelText: 'Lebar (cm)',
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
                  double panjangValue = double.tryParse(panjang.text) ?? 0;
                  double lebarValue = double.tryParse(lebar.text) ?? 0;

                  // Call the method to calculate the area of the parallelogram
                  luasPersegiPanjang.luasPersegiPanjang(
                      panjangValue, lebarValue);
                },
                child: Text(
                  'Hitung Luas Persegi Panjang',
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
                'Luas Persegi Panjang:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Obx(() => Text(
                    '${luasPersegiPanjang.hasilLuasPersegiPanjang.value} cm',
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
