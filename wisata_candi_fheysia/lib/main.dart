import 'package:flutter/material.dart';
import 'package:wisata_candi_fheysia/data/candi_data.dart';
import 'package:wisata_candi_fheysia/screens/detail_screen.dart';
import 'package:wisata_candi_fheysia/screens/profile_screen.dart';
import 'package:wisata_candi_fheysia/screens/sign_in_screen.dart';
import 'package:provider/provider.dart';
import 'providers/favorite_provider.dart';
import 'providers/auth_provider.dart';


void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ChangeNotifierProvider(create: (_) => AuthProvider()),
    ],
    child: const MyApp(),
  ),
  );
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
      //home: DetailScreen(candi: candiList[0],),
      home: SignInScreen(),
    );
  }
}
