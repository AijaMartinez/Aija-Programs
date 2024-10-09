import 'package:flutter/material.dart';
import 'pages/homescr.dart';

void main() {
  runApp(MyProgram());
}

class MyProgram extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Datos del Usuario',
      home: HomeSca(),
    );
  }
}

