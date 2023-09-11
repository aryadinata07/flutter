import 'package:flutter/material.dart';
import 'package:tugas_rumus_3/bangun/jajarGenjang.dart';
import 'bangun/balok.dart';
import 'bangun/persegi.dart';
import 'bangun/persegi_panjang.dart';
import 'bangun/lingkaran.dart';

class menu extends StatefulWidget {
  const menu({super.key});

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  final List<Map<String, String>> dummyData = [
    {
      'bangun': 'Segitiga',
      'rumus': 'Alas * Tinggi',
    },
    {
      'bangun': 'Persegi',
      'rumus': 'sisi * sisi',
    },
    {
      'bangun': 'Persegi Panjang',
      'rumus': 'panjang * lebar',
    },
    {
      'bangun': 'Jajar Genjang',
      'rumus': 'alas * tinggi',
    },
    {
      'bangun': 'Lingkaran',
      'rumus': 'pi * jari jari',
    },
  ];

  final Map<String, Widget> bangunPages = {
    'Segitiga': balok(),
    'Persegi': persegi(),
    'Persegi Panjang': persegiPanjang(),
    'Jajar Genjang': jajarGenjang(),
    'Lingkaran': lingkaran(),
  };

  void navigateToPage(String bangun) {
    if (bangunPages.containsKey(bangun)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => bangunPages[bangun]!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Bangun Datar')),
      body: ListView.builder(
        itemCount: dummyData.length,
        itemBuilder: (context, index) {
          final item = dummyData[index];
          return GestureDetector(
            onTap: () {
              navigateToPage(item['bangun']!);
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              height: 100,
              child: Card(
                elevation: 3,
                child: ListTile(
                  tileColor: Colors.white,
                  contentPadding: EdgeInsets.only(top: 8, left: 10),
                  title: Text(item['bangun']!),
                  subtitle: Text('Rumus: ${item['rumus']}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
