import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UploadPDF extends StatelessWidget {
  const UploadPDF({super.key});

  Future<firebase_storage.UploadTask?> uploadFile(Uint8List? file) async {
    if (file == null) {
      print('No file has been printed');
      return null;
    }

    firebase_storage.UploadTask uploadTask;

    // Create a Reference to the file
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('files')
        .child('/some-file4.pdf');

    final metadata = firebase_storage.SettableMetadata(
      contentType: 'file/pdf',
      //customMetadata: {'picked-file-path': file.path});
    );
    print("Uploading..!");

    uploadTask = ref.putData(await file, metadata);

    print("done..!");
    return Future.value(uploadTask);
  }

  Future<firebase_storage.UploadTask?> uploadFileMobile(File? file) async {
    if (file == null) {
      print('No file has been printed');
      return null;
    }

    firebase_storage.UploadTask uploadTask;

    // Create a Reference to the file
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('files')
        .child('/some-file4.pdf');

    final metadata = firebase_storage.SettableMetadata(
        contentType: 'file/pdf',
        customMetadata: {'picked-file-path': file.path});

    print("Uploading..!");

    uploadTask = ref.putData(await file.readAsBytesSync(), metadata);

    print("done..!");
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
              if (kIsWeb) {
                Uint8List? uploadfile = result.files.single.bytes;
                //var ceva = result.files.single.path;
                //if (ceva != null) {
                //File file = File(ceva);
                firebase_storage.UploadTask? task =
                    await uploadFile(uploadfile);
                Navigator.pop(context);
                //}
              } else {
                var ceva = result.files.single.path;
                if (ceva != null) {
                  File file = File(ceva);
                  firebase_storage.UploadTask? task =
                      await uploadFileMobile(file);
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
