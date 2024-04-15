import 'dart:typed_data';

import 'package:flutter/material.dart';

class ShowImageWidget extends StatelessWidget {
  final Uint8List imageBytes;

  const ShowImageWidget({
    Key? key,
    required this.imageBytes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.memory(
      imageBytes,
      fit: BoxFit.contain,
    );
  }
}
