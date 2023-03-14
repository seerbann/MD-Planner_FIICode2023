import 'package:flutter/material.dart';

class BlueVector extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 414;
    final double _yScaling = size.height / 500;
    path.lineTo(22.0598 * _xScaling, 54.1355 * _yScaling);
    path.cubicTo(
      89.4315 * _xScaling,
      -79.4696 * _yScaling,
      166.721 * _xScaling,
      80.1789 * _yScaling,
      166.721 * _xScaling,
      80.1789 * _yScaling,
    );
    path.cubicTo(
      166.721 * _xScaling,
      80.1789 * _yScaling,
      68.4189 * _xScaling,
      135.909 * _yScaling,
      68.4189 * _xScaling,
      135.909 * _yScaling,
    );
    path.cubicTo(
      68.4189 * _xScaling,
      135.909 * _yScaling,
      -45.3119 * _xScaling,
      187.74 * _yScaling,
      22.0598 * _xScaling,
      54.1355 * _yScaling,
    );
    path.cubicTo(
      22.0598 * _xScaling,
      54.1355 * _yScaling,
      22.0598 * _xScaling,
      54.1355 * _yScaling,
      22.0598 * _xScaling,
      54.1355 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

/*
 decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Color.fromRGBO(51,112,255,1),
                Color.fromRGBO(122, 162, 255, 1),
              ],
            )
          )
 */