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
          ]),
        ));
  }

  Widget _detallesDelUsuario() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Center(
          key: _formKey,
          child: SizedBox(
            width: 300,
            child: Column(
              children: [
                TextFormField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'ID',
                  ),
                  keyboardType: TextInputType
                      .number, 
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
                                    return Center(
                                        child: CircularProgressIndicator());
                                  } else if (id > 0) {
                                    return AlertDialog(
                                      content: snapshot.data != null
                                          ? Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text('ID: ${actividad!.id}'),
                                                Text(
                                                    'Nombre: ${actividad.name}'),
                                                Text(
                                                    'Username: ${actividad.username}'),
                                                Text(
                                                    'Email: ${actividad.email}'),
                                                Text(
                                                    'Teléfono: ${actividad.phone}'),
                                                Text(
                                                    'Website: ${actividad.website}'),
                                                Text(
                                                    'Dirección: ${actividad.address.street}, ${actividad.address.city}'),
                                                Text(
                                                    'Compañía: ${actividad.company.name}'),
                                              ],
                                            )
                                          : Text(
                                              'No se encontraron datos para el ID proporcionado.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Cerrar'),
                                        ),
                                      ],
                                    );
                                  }
                                  return Text('NO FOUND');
                                },
                              ));
                    } else {
                      showDialog(
                        context: _formKey.currentContext!,
                        builder: (context) => AlertDialog(
                          title: Text('Error'),
                          content: Text('Por favor, introduce un ID válido.'),
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
