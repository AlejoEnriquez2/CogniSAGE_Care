import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui' as ui;
import '../models/models.dart';

class ExecutiveBoard extends StatefulWidget {
  final AnswersModel answersModel;
  final double canvaSize;
  final int formId;

  const ExecutiveBoard({
    super.key,
    required this.answersModel,
    required this.canvaSize,
    required this.formId,
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
  bool _allowInput = true;
  int _greenLineCount = 0;
  int _correctLines = 0;

  List<Line> linesForm1 = [
    Line(
        start: const Offset(50, 330),
        end: const Offset(50, 495),
        isTheCorrect: false),
    Line(
        start: const Offset(210, 330),
        end: const Offset(210, 495),
        isTheCorrect: false),
    // Line(start: const Offset(370, 330), end: const Offset(370, 495)),
    Line(
        start: const Offset(210, 135),
        end: const Offset(210, 300),
        isTheCorrect: false),
    Line(
        start: const Offset(370, 135),
        end: const Offset(370, 300),
        isTheCorrect: false),
    Line(
        start: const Offset(65, 315),
        end: const Offset(190, 315),
        isTheCorrect: false),
    Line(
        start: const Offset(65, 505),
        end: const Offset(190, 505),
        isTheCorrect: false),
    Line(
        start: const Offset(230, 315),
        end: const Offset(350, 315),
        isTheCorrect: false),
    // Line(start: const Offset(230, 505), end: const Offset(350, 505)),
    Line(
        start: const Offset(230, 120),
        end: const Offset(350, 120),
        isTheCorrect: false),
    Line(
        start: const Offset(215, 105),
        end: const Offset(285, 20),
        isTheCorrect: true),
    Line(
        start: const Offset(305, 20),
        end: const Offset(370, 105),
        isTheCorrect: true),
    Line(
        start: const Offset(390, 125),
        end: const Offset(470, 205),
        isTheCorrect: true),
    Line(
        start: const Offset(470, 230),
        end: const Offset(390, 305),
        isTheCorrect: true),
  ];

  List<Line> linesForm2 = [
    Line(
        start: const Offset(50, 490),
        end: const Offset(150, 325),
        isTheCorrect: false),
    Line(
        start: const Offset(165, 325),
        end: const Offset(270, 490),
        isTheCorrect: false),
    Line(
        start: const Offset(60, 500),
        end: const Offset(260, 500),
        isTheCorrect: false),
    //
    Line(
        start: const Offset(165, 305),
        end: const Offset(260, 170),
        isTheCorrect: false),
    Line(
        start: const Offset(275, 170),
        end: const Offset(375, 300),
        isTheCorrect: false),
    Line(
        start: const Offset(170, 315),
        end: const Offset(370, 315),
        isTheCorrect: false),
    //
    Line(
        start: const Offset(280, 490),
        end: const Offset(380, 325),
        isTheCorrect: false),
    Line(
        start: const Offset(285, 160),
        end: const Offset(470, 160),
        isTheCorrect: true),
    Line(
        start: const Offset(395, 300),
        end: const Offset(485, 165),
        isTheCorrect: true),
  ];

  List<Line> lines = [];

  void _lockBoard() {
    setState(() {
      _isLocked = true;
    });
  }

  void _clearBoard() {
    setState(() {
      _isLocked = false;
      _points.clear();
      lines.forEach((line) {
        line.isDrawnOn = false;
        line.color = Colors.black;
      });
      _allowInput = true;
      _greenLineCount = 0;
      _correctLines = 0;
      print('Cleared board');
    });
  }

  void _convertToByteData() async {
    widget.answersModel.executiveLinesDraw = [];
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

    String base64String = base64Encode(bytes);

    // Use the bytes as needed

    widget.answersModel.executiveLinesDraw!.add(base64String);
    widget.answersModel.isExecLinesDrawCompleted = false;
  }

  void _checkIfLineIsDrawnOn() {
    if (!_allowInput) return;
    var linesAmount = 0;
    if (widget.formId == 1) {
      linesAmount = 4;
    } else {
      linesAmount = 2;
    }

    for (var line in lines) {
      line.isDrawnOn = false;
      for (int i = 0; i < _points.length - 1; i++) {
        if (_points[i] != Offset.zero && _points[i + 1] != Offset.zero) {
          if (_doLinesIntersect(
              _points[i], _points[i + 1], line.start, line.end)) {
            line.isDrawnOn = true;
            if (line.color != Colors.green) {
              line.color = Colors.green;
              _greenLineCount++;
              if (line.isTheCorrect != true) {
                print('INCORRECT LINE: ' +
                    _correctLines.toString() +
                    "on line: " +
                    line.start.toString());
              } else {
                _correctLines++;
                print('CORRECT LINE: ' + _correctLines.toString());
              }
              if (_greenLineCount >= linesAmount) {
                _lockBoard();
              }
            }
            break;
          }
        }
      }
      if (line.isDrawnOn == false) {
        line.color = Colors.black;
      }
    }
  }

  int _orientation(Offset p, Offset q, Offset r) {
    double val = (q.dy - p.dy) * (r.dx - q.dx) - (q.dx - p.dx) * (r.dy - q.dy);
    if (val == 0.0) return 0; // Collinear
    return (val > 0) ? 1 : 2; // Clock or Counterclockwise
  }

  bool _onSegment(Offset p, Offset q, Offset r) {
    if (q.dx <= max(p.dx, r.dx) &&
        q.dx >= min(p.dx, r.dx) &&
        q.dy <= max(p.dy, r.dy) &&
        q.dy >= min(p.dy, r.dy)) {
      return true;
    }
    return false;
  }

  bool _doLinesIntersect(Offset p1, Offset p2, Offset p3, Offset p4) {
    // Find the four orientations needed for the general and special cases
    int o1 = _orientation(p1, p2, p3);
    int o2 = _orientation(p1, p2, p4);
    int o3 = _orientation(p3, p4, p1);
    int o4 = _orientation(p3, p4, p2);

    // General case
    if (o1 != o2 && o3 != o4) {
      return true;
    }

    // Special Cases
    // p1, p2, p3 are collinear and p3 lies on segment p1p2
    if (o1 == 0 && _onSegment(p1, p3, p2)) return true;

    // p1, p2, p4 are collinear and p4 lies on segment p1p2
    if (o2 == 0 && _onSegment(p1, p4, p2)) return true;

    // p3, p4, p1 are collinear and p1 lies on segment p3p4
    if (o3 == 0 && _onSegment(p3, p1, p4)) return true;

    // p3, p4, p2 are collinear and p2 lies on segment p3p4
    if (o4 == 0 && _onSegment(p3, p2, p4)) return true;

    // Doesn't fall in any of the above cases
    return false;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.answersModel.isExecLinesDrawCompleted != true) {
    } else {
      widget.answersModel.executiveLines = _correctLines.toString();
      _convertToByteData();
    }
    if (widget.formId == 1) {
      lines = linesForm1;
    } else if (widget.formId == 4) {
      lines = linesForm2;
    }
    return GestureDetector(
      onPanDown: (DragDownDetails details) {
        RenderBox renderBox = context.findRenderObject() as RenderBox;
        Offset touchPosition = renderBox.globalToLocal(details.globalPosition);
        print("POSITION: " + touchPosition.toString());
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
            _checkIfLineIsDrawnOn();
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

                // IconButton(
                //   onPressed: () {
                //     setState(() {
                //       _isLocked = !_isLocked;
                //     });
                //   },
                //   icon: Icon(
                //     _isLocked ? Icons.lock : Icons.lock_open,
                //   ),
                // ),

                IconButton(
                  onPressed: _clearBoard,
                  icon: SvgPicture.asset(
                    'assets/icons/eraser-solid.svg',
                    height: 20,
                    width: 20,
                  ),
                ),
                // IconButton(
                //   onPressed: () {
                //     setState(() {
                //       _convertToByteData();
                //     });
                //   },
                //   icon: const Icon(Icons.save),
                // ),
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
      paint.color = line.color ?? Colors.black;
      canvas.drawLine(line.start, line.end, paint);
    }

    paint.color = Colors.black;
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
  Color? color;
  bool? isTheCorrect;

  Line(
      {required this.start,
      required this.end,
      required this.isTheCorrect,
      isDrawnOn,
      this.color = Colors.black});
}
