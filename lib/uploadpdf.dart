import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UploadPDF extends StatefulWidget {
  const UploadPDF({Key? key, required this.numePacient}) : super(key: key);
  final String numePacient;
  @override
  State<UploadPDF> createState() => _UploadPDFState();
}

class _UploadPDFState extends State<UploadPDF> {
  Future<String> getPacientId(String numePacient) async {
    String idPacient = "aaaa";
    print(idPacient);
    await FirebaseFirestore.instance
        .collection('users')
        .where('fullName', isEqualTo: numePacient)
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              idPacient = document.id;
            }));
    print(idPacient);
    return idPacient;
  }

  Future adaugaFisaMedicala(String linkFisaMedicala, String numePacient) async {
    var list = [linkFisaMedicala];
    var idPacient = await getPacientId(numePacient);
    FirebaseFirestore.instance
        .collection('users')
        .doc(idPacient)
        .update({"fiseMedicale": FieldValue.arrayUnion(list)});
  }

  Future<firebase_storage.UploadTask?> uploadFile(
      Uint8List? file, String filename) async {
    if (file == null) {
      print('No file has been printed');
      return null;
    }

    firebase_storage.UploadTask uploadTask;
    String numePacient = widget.numePacient;
    // Create a Reference to the file
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('files')
        .child('/${filename}');

    final metadata = firebase_storage.SettableMetadata(
      contentType: 'file/pdf',
      //customMetadata: {'picked-file-path': file.path});
    );
    print("Uploading..!");

    uploadTask = ref.putData(await file, metadata);

    print("done..!");
    await Future.delayed(const Duration(seconds: 2), () async {
      String downloadURL = await firebase_storage.FirebaseStorage.instance
          .ref('files/${filename}')
          .getDownloadURL();
      print(downloadURL);
      await adaugaFisaMedicala(downloadURL, numePacient);
    });
    return Future.value(uploadTask);
  }

  Future<firebase_storage.UploadTask?> uploadFileMobile(
      File? file, String filename) async {
    if (file == null) {
      print('No file has been printed');
      return null;
    }

    firebase_storage.UploadTask uploadTask;
    String numePacient = widget.numePacient;
    // Create a Reference to the file
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('files')
        .child('/${filename}');

    final metadata = firebase_storage.SettableMetadata(
        contentType: 'file/pdf',
        customMetadata: {'picked-file-path': file.path});

    print("Uploading..!");

    uploadTask = ref.putData(await file.readAsBytesSync(), metadata);

    print("done..!");
    await Future.delayed(const Duration(seconds: 2), () async {
      String downloadURL = await firebase_storage.FirebaseStorage.instance
          .ref('files/${filename}')
          .getDownloadURL();
      print(downloadURL);
      await adaugaFisaMedicala(downloadURL, numePacient);
    });

    return Future.value(uploadTask);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Select File'),
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles();
            if (result != null) {
              String filename = result.files.single.name;
              if (kIsWeb) {
                Uint8List? uploadfile = result.files.single.bytes;
                //var ceva = result.files.single.path;
                //if (ceva != null) {
                //File file = File(ceva);
                firebase_storage.UploadTask? task =
                    await uploadFile(uploadfile, filename);

                Navigator.pop(context);
                //}
              } else {
                var ceva = result.files.single.path;
                if (ceva != null) {
                  File file = File(ceva);
                  firebase_storage.UploadTask? task =
                      await uploadFileMobile(file, filename);

                  Navigator.pop(context);
                }
              }
            } else {
              // User canceled the picker
            }
          },
        ),
      ),
    );
  }
}
