import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class loadPdf extends StatefulWidget {
  loadPdf({Key? key, required this.path}) : super(key: key);
  final String path;

  @override
  State<loadPdf> createState() => _loadPdfState();
}

class _loadPdfState extends State<loadPdf> {
  Uint8List? _documentBytes;
  String path2 = "";
  //'https://firebasestorage.googleapis.com/v0/b/flutterfirebase-6c279.appspot.com/o/GIS.pdf?alt=media&token=51654170-c140-4ffa-ae1a-9fb431d0dee2';
  //'https://firebasestorage.googleapis.com/v0/b/my-notes-vlad-flutter.appspot.com/o/files%2F02-complexity.pdf?alt=media&token=a48d2c77-ca26-4aff-8dc0-8f20ebe52d8b';
  //'https://firebasestorage.googleapis.com/v0/b/my-notes-vlad-flutter.appspot.com/o/files%2Fsome-file.pdf?alt=media&token=3479dd85-3214-4ac3-97f8-805fd961d9da';
  @override
  void initState() {
    path2 = widget.path;
    getPdfBytes();
    super.initState();
  }

  void getPdfBytes() async {
    if (kIsWeb) {
      firebase_storage.Reference pdfRef =
          firebase_storage.FirebaseStorage.instanceFor(bucket: '')
              .refFromURL(path2);
      //size mentioned here is max size to download from firebase.
      await pdfRef.getData(104857600).then((value) {
        _documentBytes = value;
        setState(() {});
      });
    } else {
      HttpClient client = HttpClient();
      final Uri url = Uri.base.resolve(path2);
      final HttpClientRequest request = await client.getUrl(url);
      final HttpClientResponse response = await request.close();
      _documentBytes = await consolidateHttpClientResponseBytes(response);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child = const Center(child: CircularProgressIndicator());
    if (_documentBytes != null) {
      child = SfPdfViewer.memory(
        _documentBytes!,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fisa Medicala'),
        backgroundColor: Colors.black,
      ),
      body: child,
    );
  }
}
