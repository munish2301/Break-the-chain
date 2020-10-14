import 'dart:math' as math;

import 'package:flutter/material.dart';

class Model extends StatelessWidget {
  final List<dynamic> results;
  final int _imgHeight;
  final int _imgWidth;
  final double screenH;
  final double screenW;
  final String model;
  Model(this.results, this._imgHeight, this._imgWidth, this.screenH,
      this.screenW, this.model);

  @override
  Widget build(BuildContext context) {
    List<Widget> _renderBoxes() {
      return results.map((re) {
        var _x = re["rect"]["x"];
        var _w = re["rect"]["w"];
        var _y = re["rect"]["y"];
        var _h = re["rect"]["h"];
        var scaleW, scaleH, x, y, w, h;

        if (screenH / screenW > _imgHeight / _imgWidth) {
          scaleW = screenH / _imgHeight * _imgWidth;
          scaleH = screenH;
          var difW = (scaleW - screenW) / scaleW;
          x = (_x - difW / 2) * scaleW;
          w = _w * scaleW;
          if (_x < difW / 2) w -= (difW / 2 - _x) * scaleW;
          y = _y * scaleH;
          h = _h * scaleH;
        } else {
          scaleH = screenW / _imgHeight * _imgWidth;
          scaleW = screenW;
          var difH = (scaleH - screenH) / scaleH;
          x = _x * scaleW;
          w = _w * scaleW;
          y = (_y - difH / 2) * scaleH;
          h = _h * scaleH;
          if (_y < difH / 2) h -= (difH / 2 - _y) * scaleH;
        }

        return Positioned(
          left: math.max(0, x),
          top: math.max(0, y),
          width: w,
          height: h,
          child: Container(
            padding: EdgeInsets.only(top: 5.0, left: 5.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: re['isSafe'] == true ? Colors.green : Colors.red,
                width: 4.0,
              ),
            ),
            child: Text(
              re['isSafe'] == true ? "SAFE" : "UNSAFE",
              style: TextStyle(
                color: re['isSafe'] == true ? Colors.green : Colors.red,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        );
      }).toList();
    }

    List<dynamic> widgets = _renderBoxes();
    return Stack(children: [
      Stack(
        children: widgets,
      ),
    ]);
  }
}
