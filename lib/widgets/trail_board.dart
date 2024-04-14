import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui' as ui;

import 'package:image_gallery_saver/image_gallery_saver.dart';
import '../models/models.dart';

class TrailBoard extends StatefulWidget {
  final AnswersModel answersModel;
  final double canvaSize;
  final String type;

  const TrailBoard({
    Key? key,
    required this.answersModel,
    required this.canvaSize,
    required this.type,
  }) : super(key: key);

  @override
  _TrailBoardState createState() => _TrailBoardState();
}

class _TrailBoardState extends State<TrailBoard> {
  List<Offset> _points = <Offset>[];
  bool _isLocked = false;

  void _undoLastLine() {
    if (!_isLocked && _points.isNotEmpty) {
      setState(() {
        _points.removeLast();
        int lastIndex = _points.lastIndexOf(Offset.zero);

        if (lastIndex != -1) {
          _points.removeRange(lastIndex, _points.length);
        } else {
          _points.clear();
        }
        _points.add(Offset.zero);
        print('Removed last line');
      });
    }
  }

  void _clearBoard() {
    if (!_isLocked) {
      setState(() {
        _points.clear();
        print('Cleared board');
      });
    }
  }

  void _saveDraw() async {
    // Create a new image recorder
    ui.PictureRecorder recorder = ui.PictureRecorder();
    Canvas canvas = Canvas(recorder);

    // Paint the draw on the canvas
    print("Points length: $_points");
    canvas.drawColor(
      Colors.white,
      BlendMode.color,
    );
    _BoardPainter(points: _points)
        .paint(canvas, Size(widget.canvaSize, widget.canvaSize));
    print("Points length now: $_points");
    // End recording and obtain the image
    ui.Picture picture = recorder.endRecording();
    ui.Image image = await picture.toImage(
      widget.canvaSize.toInt(),
      widget.canvaSize.toInt(),
    );

    // Convert the image to bytes
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List bytes = byteData!.buffer.asUint8List();

    // Save the image to file
    String imageName = DateTime.now().toString();
    final result = await ImageGallerySaver.saveImage(bytes, name: imageName);

    if (result['isSuccess']) {
      print('Draw saved successfully' + result.toString());
    } else {
      print('Failed to save draw');
    }
  }

  void _convertToByteData() async {
    // Create a new image recorder
    ui.PictureRecorder recorder = ui.PictureRecorder();
    Canvas canvas = Canvas(recorder);

    // Paint the draw on the canvas
    canvas.drawColor(
      Colors.white,
      BlendMode.color,
    );
    _BoardPainter(points: _points)
        .paint(canvas, Size(widget.canvaSize, widget.canvaSize));
    // End recording and obtain the image
    ui.Picture picture = recorder.endRecording();
    ui.Image image = await picture.toImage(
      widget.canvaSize.toInt(),
      widget.canvaSize.toInt(),
    );

    // Convert the image to bytes
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List bytes = byteData!.buffer.asUint8List();
    print(bytes);
    // Use the bytes as needed
    // ...
    if (widget.type == 'redraw') {
      widget.answersModel.constructionsRedraw = bytes;
    } else if (widget.type == 'draw') {
      widget.answersModel.constructionsDraw = bytes;
    }
  }

  @override
  Widget build(BuildContext context) {
    Offset _startPoint = Offset.zero;
    Offset _endPoint = Offset.zero;

    return GestureDetector(
      onPanDown: (DragDownDetails details) {
        if (!_isLocked) {
          RenderBox renderBox = context.findRenderObject() as RenderBox;
          _startPoint = renderBox.globalToLocal(details.globalPosition);
        }
      },
      onPanUpdate: (DragUpdateDetails details) {
        if (!_isLocked) {
          RenderBox renderBox = context.findRenderObject() as RenderBox;
          _endPoint = renderBox.globalToLocal(details.globalPosition);
        }
      },
      onPanEnd: (DragEndDetails details) {
        if (!_isLocked) {
          setState(() {
            _points.add(_startPoint);
            _points.add(_endPoint);
            _points.add(Offset.zero);
            _startPoint = Offset.zero;
            _endPoint = Offset.zero;
          });
        }
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 254, 185),
              border: Border.all(color: Colors.black, width: 2.0),
            ),
            height: widget.canvaSize,
            width: widget.canvaSize,
            child: CustomPaint(
              painter: _BoardPainter(points: _points),
            ),
          ),
          Container(
            height: 75,
            width: widget.canvaSize,
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: _undoLastLine,
                  icon: const Icon(Icons.undo),
                ),
                IconButton(
                  onPressed: _clearBoard,
                  icon: SvgPicture.asset(
                    'assets/icons/eraser-solid.svg',
                    height: 20,
                    width: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _saveDraw();
                    });
                  },
                  icon: const Icon(Icons.save),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _BoardPainter extends CustomPainter {
  final List<Offset> points;

  _BoardPainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    drawNode(canvas, size, paint, Offset(80, 100), '1');
    drawNode(canvas, size, paint, Offset(255, 50), 'A');
    drawNode(canvas, size, paint, Offset(355, 100), '2');
    drawNode(canvas, size, paint, Offset(180, 140), 'B');
    drawNode(canvas, size, paint, Offset(430, 170), '3');
    drawNode(canvas, size, paint, Offset(480, 100), 'C');

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != Offset.zero && points[i + 1] != Offset.zero) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  void drawNode(
      Canvas canvas, Size size, Paint paint, Offset position, String step) {
    canvas.drawCircle(
      position,
      25,
      paint..style = PaintingStyle.stroke,
    );
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: step,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 25, // Increase the font size
          fontWeight: FontWeight.bold,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      position - Offset(textPainter.width / 2, textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
