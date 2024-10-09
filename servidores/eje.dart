/* 

import 'package:flutter/material.dart';

class HomeSca extends StatelessWidget {
  const HomeSca({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              title: Text(
                'Datos del usuario',
                style: TextStyle(color: Colors.white),
              ),
            backgroundColor: Colors.black),
            bottomNavigationBar: TabBar(tabs: [
            Tab(text: 'Informacion 1'),
            Tab(text: 'Informacion 2'),
          ]),
          body: TabBarView(children: [
            _detallesDelUsuario(),
            _detallesDosDelUsuario(),
          ]),
        ));
  }
}

Widget _detallesDelUsuario() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: 300,
          child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Id'
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'name'
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'username'
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'email'
              ),
            ),
            Text('Address'),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'street'
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'suite'
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'city'
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'city'
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'zipcode'
              ),
            ),
            Text('Geo'),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'lat'
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'lng'
              ),
            ),
          Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(onPressed: () {}, child: const Text('Enviar')),
          ],
        ),
        ),
    
        
      ),
    ),
  );
}


Widget _detallesDosDelUsuario() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: 300,
          child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Phone'
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Website'
              ),
            ),
            Text('Company'),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'name'
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'catchPhrase'
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'bs'
              ),
            ),
          
          Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(onPressed: () {}, child: const Text('Enviar')),
          ],
        ),
        ),
    
        
      ),
    ),
  );
}

 */