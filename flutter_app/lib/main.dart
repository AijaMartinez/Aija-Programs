import 'package:flutter/material.dart';
import 'pages/homescr.dart';

void main() {
  runApp(const MyProgram());
}

class MyProgram extends StatelessWidget {
  const MyProgram({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Datos del Usuario',
      debugShowCheckedModeBanner: false,
      home: HomeSca(),
    );
  }
}

