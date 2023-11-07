import 'dart:io';

import 'package:crud_demo/services/firebase_services.dart';
import 'package:crud_demo/services/select_image.dart';

import 'package:flutter/material.dart';

class AddVivenciaPage extends StatefulWidget {
  const AddVivenciaPage({super.key});

  @override
  State<AddVivenciaPage> createState() => _AddVivenciaPageState();
}

class _AddVivenciaPageState extends State<AddVivenciaPage> {
  TextEditingController nombrectr = TextEditingController(text: "");
  TextEditingController descripcionctr = TextEditingController(text: "");
  TextEditingController fechactr = TextEditingController(text: "");

  File? image_to_uplodad;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Vivencia'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextField(
                controller: nombrectr,
                decoration:
                    const InputDecoration(hintText: 'ingrese el titulo'),
              ),
              TextField(
                controller: descripcionctr,
                decoration:
                    const InputDecoration(hintText: 'ingrese la descripcion'),
              ),
              TextField(
                controller: fechactr,
                decoration: const InputDecoration(hintText: 'ingrese la fecha'),
              ),
              ElevatedButton(
                  onPressed: () async {
                    final image = await getImage();
                    setState(() {
                      image_to_uplodad = File(image!.path);
                    });
                  },
                  child: const Text("selecciona la imagen")),
              image_to_uplodad != null
                  ? Image.file(
                      image_to_uplodad!,
                      height: 200,
                      width: double.infinity,
                    )
                  : Container(
                      margin: const EdgeInsets.all(5),
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey),
              ElevatedButton(
                  onPressed: () async {
                      if (image_to_uplodad == null) {
                        return;
                      }
                      final uploaded = await uploadImage(image_to_uplodad!);
                      if (uploaded) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("imagen subida correctamente")));
                                setState(() async {
                                  await saveVivenca(nombrectr.text, descripcionctr.text,
                                  fechactr.text)
                              .then((_) {
                            Navigator.pop(context);
                                });
                            
                          });
              
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Error al subir la imagen")));
                      }
                   
                  },
                  child: const Text("guardar")),
            ],
          ),
        ));
  }
}
