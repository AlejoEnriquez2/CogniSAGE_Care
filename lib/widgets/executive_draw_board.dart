import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui' as ui;
import '../models/models.dart';

class ExecutiveDrawBoard extends StatefulWidget {
  final AnswersModel answersModel;
  final double canvaSize;
  final String type;

  const ExecutiveDrawBoard({
    super.key,
    required this.answersModel,
    required this.canvaSize,
    required this.type,
  });

  @override
  _ExecutiveDrawBoardState createState() => _ExecutiveDrawBoardState();
}

class _ExecutiveDrawBoardState extends State<ExecutiveDrawBoard> {
  List<Offset> _points = <Offset>[];
  bool _isLocked = false;
  List<String> answers = [];

  void _clearBoard() {
    if (!_isLocked) {
      setState(() {
        _points.clear();
        answers = [];
        print('Cleared board');
      });
    }
  }

  void _convertToByteData() async {
    // Create a new image recorder
    ui.PictureRecorder recorder = ui.PictureRecorder();
    Canvas canvas = Canvas(recorder);
    widget.answersModel.executiveDraw = [];

    if (_points.isEmpty) {
      return;
    }

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

    String base64String = base64Encode(bytes);

    if (widget.type == 'executive') {
      widget.answersModel.executiveDraw!.add(base64String);
    }
    widget.answersModel.isExecDrawCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.answersModel.isExecDrawCompleted != true) {
    } else {
      _convertToByteData();
    }
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        if (!_isLocked) {
          setState(() {
            RenderBox renderBox = context.findRenderObject() as RenderBox;
            Offset localPosition =
                renderBox.globalToLocal(details.globalPosition);
            if (localPosition.dx >= 0 &&
                localPosition.dx <= renderBox.size.width &&
                localPosition.dy >= 0 &&
                localPosition.dy <= renderBox.size.height - 75) {
              _points = List.from(_points)..add(localPosition);
            }
          });
        }
      },
      onPanEnd: (DragEndDetails details) {
        if (!_isLocked) {
          setState(() {
            _points.add(Offset.zero);
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
                // IconButton(
                //   onPressed: _undoLastLine,
                //   icon: const Icon(Icons.undo),
                // ),
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
                      _convertToByteData();
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

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != Offset.zero && points[i + 1] != Offset.zero) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  void drawLine(Canvas canvas, Paint paint, Line line) {
    canvas.drawLine(
        line.start,
        line.end,
        paint
          ..style = PaintingStyle.stroke
          ..color = Colors.black
          ..strokeWidth = 10.0); // Increase the strokeWidth value
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Line {
  Offset start;
  Offset end;
  bool? isDrawnOn;

  Line({required this.start, required this.end, isDrawnOn});
}
