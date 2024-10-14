import 'package:flutter/material.dart';
import 'package:flutter_app/services/peticion.dart';

class HomeSca extends StatefulWidget {
  const HomeSca({
    super.key,
  });

  @override
  State<HomeSca> createState() => _HomeScaState();
}

class _HomeScaState extends State<HomeSca> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  UserServices requestModel = UserServices();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Scaffold(
          backgroundColor: const Color.fromARGB(113, 158, 158, 158),
          appBar: AppBar(
            title: const Center(
              child: Text(
                'Datos del usuario',
                style: TextStyle(color: Color.fromARGB(255, 191, 152, 236)),
              ),
            ),
            backgroundColor: Colors.black,
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.add_home),
              ),
            ]),
          ),
          body: TabBarView(children: [
            _detallesDelUsuario(),
          ]),
        ));
  }

  Widget _detallesDelUsuario() {
    return Padding(
      padding: const EdgeInsets.all(160),
      child: SingleChildScrollView(
        child: Center(
          key: _formKey,
          child: SizedBox(
            width: 300,
            child: Column(
              children: [
                TextFormField(
                  cursorColor: const Color.fromARGB(255, 221, 189, 10),
                  controller: _controller,
                  decoration: const InputDecoration(
                    floatingLabelStyle: TextStyle(color: Colors.blue),
                    labelStyle: TextStyle(color: Color.fromARGB(255, 95, 35, 136)),
                    border: OutlineInputBorder(),
                    labelText: 'ID',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const Padding(padding: EdgeInsets.all(10)),
                ElevatedButton(
                  onPressed: () async {
                    String input = _controller.text;
                    int id = int.tryParse(input) ?? 0; // Convierte a int

                    if (id > 0) {
                      var actividad = await requestModel.getIdeas(id);

                      showDialog(
                          context: _formKey.currentContext!,
                          builder: (context) => FutureBuilder(
                                future: requestModel.getIdeas(id),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 10,
                                        color: Colors.black,
                                      ),
                                    );
                                  } else if (id > 0) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        textTheme: TextTheme(
                                          bodyMedium: TextStyle(color: const Color.fromARGB(255, 223, 214, 231)),
                                        ),
                                      ) , 
                                      child: AlertDialog(
                                      backgroundColor: Colors.black,
                                      content: snapshot.data != null
                                          ? Padding(
                                              padding: const EdgeInsets.all(60),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text('ID: ${actividad!.id}'),
                                                  Text(
                                                      'Name: ${actividad.name}'),
                                                  Text(
                                                      'Username: ${actividad.username}'),
                                                  Text(
                                                      'Email: ${actividad.email}'),
                                                  Text(
                                                      'Address: ${actividad.address.street}'),
                                                  Text(
                                                      'Suite: ${actividad.address.suite}'),
                                                  Text(
                                                      'City: ${actividad.address.city}'),
                                                  Text(
                                                      'ZipCode: ${actividad.address.zipcode}'),
                                                  const Text('Address-geo: '),
                                                  Text(
                                                      'lat: ${actividad.address.geo.lat}'),
                                                  Text(
                                                      'lng: ${actividad.address.geo.lng}'),
                                                  Text(
                                                      'Phone: ${actividad.phone}'),
                                                  Text(
                                                      'Website: ${actividad.website}'),
                                                  Text(
                                                      'Company: ${actividad.company.name}'),
                                                  const Text(
                                                      'Company-catchPhrase:'),
                                                  Text(actividad
                                                      .company.catchPhrase),
                                                  const Text('Company-bs:'),
                                                  Text(actividad.company.bs),
                                                ],
                                              ),
                                            )
                                          : const Text(
                                              'No se encontraron datos para el ID proporcionado.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Cerrar'),
                                        ),
                                      ],
                                    ));
                                    
                                  }
                                  return const Text('NO FOUND');
                                },
                              ));
                    } else {
                      showDialog(
                        context: _formKey.currentContext!,
                        builder: (context) => AlertDialog(
                          title: const Text('Error'),
                          content:
                              const Text('Por favor, introduce un ID válido.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cerrar'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text('Enviar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
