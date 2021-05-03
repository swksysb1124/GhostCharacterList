import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class ChessPainter extends CustomPainter {
  // data
  List<Position> _blackPositions;
  List<Position> _whitePositions;
  int cSize = 15;

  // paint
  var _paint = Paint();

  ChessPainter(this._blackPositions, this._whitePositions, this.cSize);

  // override this method to draw your custom UI
  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / cSize;
    double eHeight = size.height / cSize;

    // 繪製棋盤背景
    _paint
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Color(0x77cdb175);
    canvas.drawRect(Offset.zero & size, _paint);

    // 繪製棋盤格
    _paint
      ..style = PaintingStyle.stroke
      ..color = Colors.black87
      ..strokeWidth = 1.0;

    for (int i = 0; i <= cSize; i++) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), _paint); // 水平格線
    }

    for (int i = 0; i <= cSize; i++) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), _paint); // 垂直格線
    }

    // 落黑子
    if (_blackPositions != null) {
      for (var position in _blackPositions) {
        drawBlackAt(position.x, position.y, canvas, eWidth);
      }
    }

    // 落白子
    if (_whitePositions != null) {
      for (var position in _whitePositions) {
        drawWhiteAt(position.x, position.y, canvas, eWidth);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true; // 如果要重繪，記得要設定為true，不然會報錯
  }

  void drawBlackAt(int x, int y, Canvas canvas, double dxy) =>
      drawAt(x, y, Colors.black, canvas, dxy);

  void drawWhiteAt(int x, int y, Canvas canvas, double dxy) =>
      drawAt(x, y, Colors.white, canvas, dxy);

  void drawAt(int x, int y, Color color, Canvas canvas, double dxy) {
    _paint
      ..style = PaintingStyle.fill
      ..color = color;

    canvas.drawCircle(
      Offset(x * dxy, y * dxy),
      min(dxy / 2, dxy / 2) - 2,
      _paint,
    );

    _paint
      ..style = PaintingStyle.stroke
      ..color = Colors.black;

    canvas.drawCircle(
      Offset(x * dxy, y * dxy),
      min(dxy / 2, dxy / 2) - 2,
      _paint,
    );
  }
}

class Position {
  int x;
  int y;

  Position(this.x, this.y);
}