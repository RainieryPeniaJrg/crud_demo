import 'package:crud_demo/services/firebase_services.dart';
import 'package:flutter/material.dart';

class AcercaDeMi extends StatelessWidget {
  const AcercaDeMi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Acerca de mi"),
        
      ),
      body: FutureBuilder(
          future: getPersona(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Padding(padding: EdgeInsets.all(10)),
                      Text(
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w300),
                          'Nombre: ${snapshot.data?[index]['nombre']}'),
                      const Padding(padding: EdgeInsets.all(10)),
                      Text(
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w300),
                          'Apellido: ${snapshot.data?[index]['apellido']}'),
                      const Padding(padding: EdgeInsets.all(10)),
                      Text(
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w300),
                          'Matricula: ${snapshot.data?[index]['matricula']}'),
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage('./assets/images/Foto2x2.jpg'),
                      ),
                    ],
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
