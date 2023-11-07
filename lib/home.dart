import 'package:crud_demo/screens/acerca_de_mi.dart';
import 'package:crud_demo/screens/add_vivencias_page.dart';

import 'package:crud_demo/screens/vivencias.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green),
      routes: {
        '/vivencias': (context) => const Vivencias(),
        '/acerca': (context) => const AcercaDeMi(),
        '/add': (context) => const AddVivenciaPage(),
      },
      title: 'War Crud 2022-0624',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tarea 2022-0624'),
          actions: [
            FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/acerca');
              },
              child: const Icon(Icons.person),
            )
          ],
        ),
        body: const Vivencias(),
      ),
    );
  }
}
