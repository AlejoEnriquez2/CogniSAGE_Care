import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui' as ui;
import '../models/models.dart';

class ExecutiveBoard extends StatefulWidget {
  final AnswersModel answersModel;
  final double canvaSize;
  final String type;

  const ExecutiveBoard({
    super.key,
    required this.answersModel,
    required this.canvaSize,
    required this.type,
  });

  @override
  _ExecutiveBoardState createState() => _ExecutiveBoardState();
}

class _ExecutiveBoardState extends State<ExecutiveBoard> {
  List<Offset> _points = <Offset>[];
  bool _isLocked = false;
  Offset startPoint = Offset.zero;
  Offset endPoint = Offset.zero;
  List<String> answers = [];

  List<Line> lines = [
    Line(start: const Offset(50, 330), end: const Offset(50, 495)),
    Line(start: const Offset(210, 330), end: const Offset(210, 495)),
    Line(start: const Offset(370, 330), end: const Offset(370, 495)),
    Line(start: const Offset(210, 135), end: const Offset(210, 300)),
    Line(start: const Offset(370, 135), end: const Offset(370, 300)),
    Line(start: const Offset(65, 315), end: const Offset(190, 315)),
    Line(start: const Offset(65, 505), end: const Offset(190, 505)),
    Line(start: const Offset(230, 315), end: const Offset(350, 315)),
    Line(start: const Offset(230, 505), end: const Offset(350, 505)),
    Line(start: const Offset(230, 120), end: const Offset(350, 120)),
    Line(start: const Offset(215, 105), end: const Offset(285, 20)),
    Line(start: const Offset(305, 20), end: const Offset(370, 105)),
    Line(start: const Offset(390, 125), end: const Offset(470, 205)),
    Line(start: const Offset(470, 230), end: const Offset(390, 305)),
  ];

  void _clearBoard() {
    if (!_isLocked) {
      setState(() {
        _points.clear();
        lines.forEach((line) {
          line.isDrawnOn = false;
        });
        answers = [];
        widget.answersModel.executiveTrail = '';
        print('Cleared board');
      });
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
    _BoardPainter(points: _points, lines: lines)
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
    } else if (widget.type == 'temp') {
      widget.answersModel.executiveTempDraw = bytes;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (DragDownDetails details) {
        if (!_isLocked) {
          RenderBox renderBox = context.findRenderObject() as RenderBox;
          startPoint = renderBox.globalToLocal(details.globalPosition);
          print("START POINT: " + startPoint.toString());
        }
      },
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
              painter: _BoardPainter(points: _points, lines: lines),
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
  final List<Line> lines;

  _BoardPainter({required this.points, required this.lines});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < lines.length; i++) {
      Line line = lines[i];
      canvas.drawLine(line.start, line.end, paint);
    }

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
