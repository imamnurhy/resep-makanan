import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resep/providers/resep_provider.dart';
import 'package:resep/pages/resep_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<ResepProvider>(
        create: (context) => ResepProvider(),
        child: const ResepPage(),
      ),
    );
  }
}
