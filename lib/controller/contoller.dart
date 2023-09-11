import 'package:get/get.dart';

class LuasController extends GetxController {
  final hasilLuasSegitiga = RxDouble(0.0);
  final hasilLuasSegiempat = RxDouble(0.0);
  final hasilLuasPersegiPanjang = RxDouble(0.0);
  final hasilLuasJajarGenjang = RxDouble(0.0);
  final hasilLuasLingkaran = RxDouble(0.0);

  luasSegitiga(double alas, double tinggi) {
    hasilLuasSegitiga.value = 0.5 * alas * tinggi;
  }

  luasSegiempat(double sisi) {
    hasilLuasSegiempat.value = sisi * sisi;
  }

  luasPersegiPanjang(double panjang, double lebar) {
    hasilLuasPersegiPanjang.value = panjang * lebar;
  }

  luasJajarGenjang(double alas, double tinggi) {
    hasilLuasJajarGenjang.value = alas * tinggi;
  }

  luasLingkaran(double jarijari) {
    hasilLuasLingkaran.value = 3.14 * jarijari * jarijari;
  }

  void resetLuasPersegiPanjang() {
    hasilLuasPersegiPanjang.value = 0.0;
  }
}
