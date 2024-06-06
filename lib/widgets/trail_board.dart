import 'dart:math' as math;
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
  final int formId;

  const TrailBoard({
    Key? key,
    required this.answersModel,
    required this.canvaSize,
    required this.type,
    required this.formId,
  }) : super(key: key);

  @override
  _TrailBoardState createState() => _TrailBoardState();
}

class _TrailBoardState extends State<TrailBoard> {
  List<Offset> _points = <Offset>[];
  bool _isLocked = false;
  Offset startPoint = Offset.zero;
  Offset endPoint = Offset.zero;
  List<String> answers = [];

  // // example circles
  // List<Circle> circles = [
  //   Circle(position: const Offset(80, 100), text: '1'),
  //   Circle(position: const Offset(255, 50), text: 'A'),
  //   Circle(position: const Offset(355, 100), text: '2'),
  //   Circle(position: const Offset(180, 140), text: 'B'),
  //   Circle(position: const Offset(430, 170), text: '3'),
  //   Circle(position: const Offset(480, 100), text: 'C'),
  // ];

  List<Circle> circles = [
    Circle(position: const Offset(80, 100), text: '1'),
    Circle(position: const Offset(200, 140), text: 'A'),
    Circle(position: const Offset(319.3, 119.8), text: '2'),
    Circle(position: const Offset(361.9, 310.4), text: 'B'),
    Circle(position: const Offset(261.3, 333.7), text: '3'),
    Circle(position: const Offset(209.4, 245.8), text: 'C'),
    Circle(position: const Offset(66.8, 412.3), text: '4'),
    Circle(position: const Offset(215.4, 493.0), text: 'D'),
    Circle(position: const Offset(401.9, 431.0), text: '5'),
    Circle(position: const Offset(494.5, 502.3), text: 'E'),
    Circle(position: const Offset(415.9, 207.1), text: '6'),
    Circle(position: const Offset(477.2, 72.5), text: 'F'),
  ];

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

        for (Circle circle in circles) {
          bool isIntersecting = false;
          for (int i = 0; i < _points.length - 1; i++) {
            if (_points[i] != Offset.zero && _points[i + 1] != Offset.zero) {
              if (doesLineIntersectCircle(_points[i], _points[i + 1], circle)) {
                isIntersecting = true;
                break;
              }
            }
          }
          circle.isDrawnOn = isIntersecting;
        }

        print('Removed last line');
      });
    }
  }

  void _clearBoard() {
    if (!_isLocked) {
      setState(() {
        _points.clear();
        circles.forEach((circle) {
          circle.isDrawnOn = false;
        });
        answers = [];
        widget.answersModel.executiveTrail = '';
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
    _BoardPainter(points: _points, circles: circles)
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
    _BoardPainter(points: _points, circles: circles)
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
  }

  bool doesLineIntersectCircle(Offset p1, Offset p2, Circle circle) {
    Offset d = Offset(p2.dx - p1.dx, p2.dy - p1.dy);
    Offset f = Offset(p1.dx - circle.position.dx, p1.dy - circle.position.dy);

    double a = d.dx * d.dx + d.dy * d.dy;
    double b = 2 * (f.dx * d.dx + f.dy * d.dy);
    double c = f.dx * f.dx + f.dy * f.dy - 27 * 27;

    double discriminant = b * b - 4 * a * c;
    if (discriminant < 0) {
      return false;
    } else {
      discriminant = math.sqrt(discriminant);
      double t1 = (-b - discriminant) / (2 * a);
      double t2 = (-b + discriminant) / (2 * a);

      if ((t1 >= 0 && t1 <= 1) || (t2 >= 0 && t2 <= 1)) {
        return true;
      }
      return false;
    }
  }

  bool doesPointLieInCircle(Offset point, Circle circle) {
    double dx = circle.position.dx - point.dx;
    double dy = circle.position.dy - point.dy;

    double distance = math.sqrt(dx * dx + dy * dy);

    return distance <= circle.radius;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onPanDown: (DragDownDetails details) {
      //   if (!_isLocked) {
      //     RenderBox renderBox = context.findRenderObject() as RenderBox;
      //     startPoint = renderBox.globalToLocal(details.globalPosition);
      //     print("START POINT: " + startPoint.toString());
      //   }
      // },
      onPanDown: (DragDownDetails details) {
        if (!_isLocked) {
          RenderBox renderBox = context.findRenderObject() as RenderBox;
          Offset touchPosition =
              renderBox.globalToLocal(details.globalPosition);
          print("POSITION: " + touchPosition.toString());
          for (Circle circle in circles) {
            if ((touchPosition - circle.position).distance <= 25) {
              setState(() {
                circle.isDrawnOn = true;
              });
              if (!answers.contains(circle.text)) {
                answers.add(circle.text);
              }
              break;
            }
          }
        }
      },
      onPanUpdate: (DragUpdateDetails details) {
        if (!_isLocked) {
          setState(() {
            RenderBox renderBox = context.findRenderObject() as RenderBox;
            // endPoint = renderBox.globalToLocal(details.globalPosition);
            // print("END POINT: " + endPoint.toString());
            Offset localPosition =
                renderBox.globalToLocal(details.globalPosition);
            if (localPosition.dx >= 0 &&
                localPosition.dx <= renderBox.size.width &&
                localPosition.dy >= 0 &&
                localPosition.dy <= renderBox.size.height - 75) {
              _points = List.from(_points)..add(localPosition);
            }
            for (Circle circle in circles) {
              if ((localPosition - circle.position).distance <= 25) {
                circle.isDrawnOn = true;

                bool isIntersecting = false;
                for (int i = 0; i < _points.length - 1; i++) {
                  if (_points[i] != Offset.zero &&
                      _points[i + 1] != Offset.zero) {
                    if (doesLineIntersectCircle(
                        _points[i], _points[i + 1], circle)) {
                      isIntersecting = true;
                      print("IT SHOULD RECORD THE CIRCLE: " + circle.text);
                      if (!answers.contains(circle.text)) {
                        answers.add(circle.text);
                      }
                      break;
                    }
                  }
                }
                circle.isDrawnOn = isIntersecting;
              }
            }
          });
        }
      },
      onPanEnd: (DragEndDetails details) {
        if (!_isLocked) {
          setState(() {
            _points.add(Offset.zero);
          });
          // setState(() {
          //   print("START POINT: " + startPoint.toString());
          //   _undoLastLine();
          //   Circle startCircle = Circle(position: Offset.zero, text: '');
          //   Circle endCircle = Circle(position: Offset.zero, text: '');
          //   for (Circle circle in circles) {
          //     if (doesPointLieInCircle(startPoint, circle)) {
          //       startCircle = circle;
          //     }
          //     if (doesPointLieInCircle(endPoint, circle)) {
          //       endCircle = circle;
          //     }
          //   }

          //   if (startCircle.position != Offset.zero &&
          //       endCircle.position != Offset.zero) {
          //     // Calculate the angle of the line for the startPoint
          //     double startAngle = math.atan2(
          //         endPoint.dy - startPoint.dy, endPoint.dx - startPoint.dx);

          //     // Calculate the x and y coordinates of the point on the startCircle's border for the startPoint
          //     double startFinalX = startCircle.position.dx +
          //         startCircle.radius * math.cos(startAngle);
          //     double startFinalY = startCircle.position.dy +
          //         startCircle.radius * math.sin(startAngle);

          //     // Replace the startPoint with the intersection point
          //     startPoint = Offset(startFinalX, startFinalY);

          //     // Calculate the angle of the line for the endPoint using the startPoint and the center of the endCircle
          //     double endAngle = math.atan2(
          //         startPoint.dy - endCircle.position.dy,
          //         startPoint.dx - endCircle.position.dx);

          //     // Calculate the x and y coordinates of the point on the endCircle's border for the endPoint
          //     double endFinalX =
          //         endCircle.position.dx + endCircle.radius * math.cos(endAngle);
          //     double endFinalY =
          //         endCircle.position.dy + endCircle.radius * math.sin(endAngle);

          //     // Replace the endPoint with the intersection point
          //     endPoint = Offset(endFinalX, endFinalY);
          //   }

          //   _points.add(startPoint);
          //   print("END POINT: " + endPoint.toString());
          //   if (endPoint.dx > 550 ||
          //       endPoint.dy > 550 ||
          //       endPoint.dx < 0 ||
          //       endPoint.dy < 0) {
          //     endPoint = startPoint;
          //   }
          //   _points.add(endPoint);
          //   _points.add(Offset.zero);
          //   startPoint = Offset.zero;
          //   endPoint = Offset.zero;

          // for (Circle circle in circles) {
          //   bool isIntersecting = false;
          //   for (int i = 0; i < _points.length - 1; i++) {
          //     if (_points[i] != Offset.zero &&
          //         _points[i + 1] != Offset.zero) {
          //       if (doesLineIntersectCircle(
          //           _points[i], _points[i + 1], circle)) {
          //         isIntersecting = true;
          //         print("IT SHOULD RECORD THE CIRCLE: " + circle.text);
          //         if (!answers.contains(circle.text)) {
          //           answers.add(circle.text);
          //         }
          //         break;
          //       }
          //     }
          //   }
          //   circle.isDrawnOn = isIntersecting;
          // }
          // });
        }
        widget.answersModel.executiveTrail = answers.toString();
        print(widget.answersModel.executiveTrail);
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
              painter: _BoardPainter(points: _points, circles: circles),
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
                // IconButton(
                //   onPressed: () {
                //     setState(() {
                //       _saveDraw();
                //     });
                //   },
                //   icon: const Icon(Icons.save),
                // )
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
  final List<Circle> circles;

  _BoardPainter({required this.points, required this.circles});

  @override
  void paint(Canvas canvas, Size size) {
    final circlePaint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    Paint paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    // drawNode(canvas, size, paint, Offset(80, 100), '1');
    // drawNode(canvas, size, paint, Offset(255, 50), 'A');
    // drawNode(canvas, size, paint, Offset(355, 100), '2');
    // drawNode(canvas, size, paint, Offset(180, 140), 'B');
    // drawNode(canvas, size, paint, Offset(430, 170), '3');
    // drawNode(canvas, size, paint, Offset(480, 100), 'C');
    for (Circle circle in circles) {
      drawCircle(canvas, size, circlePaint, circle);
    }

    TextPainter tp = TextPainter(
        text: TextSpan(
          style: TextStyle(color: Colors.black, fontSize: 25),
          text: 'Start',
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, Offset(53, 130));

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != Offset.zero && points[i + 1] != Offset.zero) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  void drawCircle(Canvas canvas, Size size, Paint paint, Circle circle) {
    canvas.drawCircle(
      circle.position,
      25,
      paint
        ..style = PaintingStyle.stroke
        ..color = circle.isDrawnOn ? Colors.green : Colors.black,
    );

    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: circle.text,
        style: TextStyle(
          color: circle.text != "1" ? Colors.black : Colors.green,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      circle.position - Offset(textPainter.width / 2, textPainter.height / 2),
    );
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

class Circle {
  Offset position;
  String text;
  bool isDrawnOn;
  double radius = 25;

  Circle({
    required this.position,
    required this.text,
    this.isDrawnOn = false,
  });
}
