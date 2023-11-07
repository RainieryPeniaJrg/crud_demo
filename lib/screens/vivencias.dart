import 'package:crud_demo/services/firebase_services.dart';
import 'package:flutter/material.dart';

class Vivencias extends StatefulWidget {
  const Vivencias({
    super.key,
  });

  @override
  State<Vivencias> createState() => _VivenciasState();
}

class _VivenciasState extends State<Vivencias> {
  @override
  void initState() {
    super.initState();
    getVivencia();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getVivencia(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                      onDismissed: (direction) async {
                        await deleteVivencia(snapshot.data?[index]['uid']);
                        snapshot.data?.removeAt(index);
                      },
                      confirmDismiss: (direcction) async {
                        bool result = false;
                        result = await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                    "Seguro de eliminar la vivencia: '${snapshot.data?[index]['titulo']}'"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          return Navigator.pop(context, false);
                                        });
                                      },
                                      child: const Text(
                                        "Cancelar",
                                        style: TextStyle(color: Colors.red),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          return Navigator.pop(context, true);
                                        });
                                      },
                                      child: const Text(
                                        "si, estoy seguro",
                                        style: TextStyle(color: Colors.green),
                                      )),
                                ],
                              );
                            });

                        return result;
                      },
                      key: Key(snapshot.data?[index]['uid']),
                      direction: DismissDirection.startToEnd,
                      background: Container(
                        color: Colors.red,
                        child: const Icon(Icons.delete_outline_sharp),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                  style: const TextStyle(
                                      fontSize: 26.5,
                                      fontWeight: FontWeight.w700),
                                  'Titulo: ${snapshot.data?[index]['titulo']}'),
                              subtitle: Text(
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400),
                                  'Descripcion: ${snapshot.data?[index]['descripcion']}  \n Audio: ${snapshot.data?[index]['audio']} \n Fecha: ${snapshot.data?[index]['fecha']}'),
                            ),
                            Image(
                              image: NetworkImage(
                                  '${snapshot.data?[index]['imagen']}'),
                            )
                          ],
                        ),
                      ));
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: const Icon(Icons.add),
      )
      
        
    );
  }
}
