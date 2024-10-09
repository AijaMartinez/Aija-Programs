import 'package:flutter/material.dart';

class HomeSca extends StatelessWidget {
  const HomeSca({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Datos del Usuario', 
      style: TextStyle(color: Colors.white),), backgroundColor: Colors.black),
      body: Center(child: Column(
        children: [
          Padding(padding: EdgeInsets.all(10)),
          
          Text('ID: '),
          Text('Name: '),
          Text('UserName: '),
          Text('Email: '),
          Text('Address:  ', style: TextStyle(color: Colors.blue),),
          Text('Street: '),
          Text('Suite: '),
          Text('City: '),
          Text('Zipcode: '),
          Text('Geo: '),
          Text('lat: '),
          Text('lng: '),
          Text('Phone: '),
          Text('Website: '),
          Text('Company: ', style: TextStyle(color: Colors.blue)),
          Text('Name: '),
          Text('catchPhrase: '),
          Text('bs: '),
          Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(onPressed: (){}, child:  Text('Enviar') ),
        ],
      ),),
    );
  }
}
