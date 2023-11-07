import "package:cloud_firestore/cloud_firestore.dart";

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
 String imagen = '';
Future<List> getPersona() async {
  List persona = [];
  CollectionReference coleccionReferencePersona = db.collection('persona');

  QuerySnapshot queryPersona = await coleccionReferencePersona.get();

  for (var element in queryPersona.docs) {
    persona.add(element.data());
  }

  await Future.delayed(const Duration(seconds: 2));

  return persona;
}

Future<List> getVivencia() async {
  List vivencias = [];

  QuerySnapshot queryVivencia = await db.collection('vivencia').get();

  for (var element in queryVivencia.docs) {
    final Map<String, dynamic> data = element.data() as Map<String, dynamic>;

    final vivencia = {
      'uid': element.id,
      'titulo': data['titulo'],
      'fecha': data['fecha'],
      'audio': data['audio'],
      'imagen': data['imagen'],
      'descripcion': data['descripcion']
    };
    vivencias.add(vivencia);
  }

  await Future.delayed(const Duration(seconds: 2));
  return vivencias;
}

Future<void> saveVivenca(
    String titulo, String descripcion, String fecha) async {
  db
      .collection('vivencia')
      .add({'titulo': titulo, 'descripcion': descripcion, 'fecha': fecha,'imagen':imagen});
}

Future<void> deleteVivencia(String uid) async {
  await db.collection('vivencia').doc(uid).delete();
  await Future.delayed(const Duration(seconds: 2));
}

final FirebaseStorage storage = FirebaseStorage.instance;

Future<bool> uploadImage(File image) async {
  final String nameFile = image.path.split('/').last;

  final Reference ref = storage.ref().child('images').child(nameFile);

  final UploadTask uploadTask = ref.putFile(image);

  final TaskSnapshot snapshot = await uploadTask.whenComplete(() => true);

  final String url = await snapshot.ref.getDownloadURL();
  imagen = url;
  if (snapshot.state == TaskState.success) {
    return true;
  } else {
    return false;
  }
}
