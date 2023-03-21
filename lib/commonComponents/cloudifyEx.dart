import 'package:cloudinary_dart/transformation/effect/effect.dart';
import 'package:cloudinary_dart/transformation/resize/resize.dart';
import 'package:cloudinary_dart/transformation/transformation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Pages/listpage/components/ListAndPacientDetails.dart';
import '../main.dart';

class Clodify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 300,
            height: 300,
            // Call the function to transform the image and generate its delivery URL.
            child: Image.network(transform()),
          ),
        ),
      ),
    );
  }
}

transform() {
  String url = (cloudinary.image('cld-sample')
        ..transformation(Transformation()
          ..resize(Resize.fill()
            ..width(250)
            ..height(250))
          ..effect(Effect.sepia())))
      .toString();
  return url;
}
