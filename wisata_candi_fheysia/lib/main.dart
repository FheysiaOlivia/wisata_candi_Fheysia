import 'package:flutter/material.dart';
import 'package:wisata_candi_fheysia/data/candi_data.dart';
import 'package:wisata_candi_fheysia/screens/detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: DetailScreen(candi: candiList[0],),
    );
  }
}
