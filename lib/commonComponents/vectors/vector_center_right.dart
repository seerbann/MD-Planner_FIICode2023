import 'package:flutter/material.dart';

class BlueVector_center extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 102;
    final double _yScaling = size.height / 70;
    path.lineTo(55.7783 * _xScaling, 80.8913 * _yScaling);
    path.cubicTo(
      -33.9165 * _xScaling,
      97.4468 * _yScaling,
      15.0848 * _xScaling,
      1.0672338 * _yScaling,
      15.0848 * _xScaling,
      1.0672338 * _yScaling,
    );
    path.cubicTo(
      15.0848 * _xScaling,
      1.0672338 * _yScaling,
      78.3807 * _xScaling,
      28.2382 * _yScaling,
      78.3807 * _xScaling,
      28.2382 * _yScaling,
    );
    path.cubicTo(
      78.3807 * _xScaling,
      28.2382 * _yScaling,
      145.473 * _xScaling,
      64.3358 * _yScaling,
      55.7783 * _xScaling,
      80.8913 * _yScaling,
    );
    path.cubicTo(
      55.7783 * _xScaling,
      80.8913 * _yScaling,
      55.7783 * _xScaling,
      80.8913 * _yScaling,
      55.7783 * _xScaling,
      80.8913 * _yScaling,
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