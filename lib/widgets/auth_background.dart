import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;
  const AuthBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey,
      child: Stack(
        children: [
          const _BlueBox(),
          const _CustomIcon(),
          child,
        ],
      ),
    );
  }
}

class _CustomIcon extends StatelessWidget {
  const _CustomIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 25),
        child: const Icon(Icons.person_pin, color: Colors.white, size: 100),
      ),
    );
  }
}

class _BlueBox extends StatelessWidget {
  const _BlueBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        width: double.infinity,
        height: size.height * 0.4,
        decoration: _customBoxDecoration(),
        child: Stack(
          children: [
            Positioned(
              child: const _Bubble(),
              top: size.height * 0.20,
              left: 20,
            ),
            Positioned(
              child: const _Bubble(),
              top: size.height * 0.01 - 30,
              left: size.width * 0.01 - 30,
            ),
            Positioned(
              child: const _Bubble(),
              top: size.height * 0.3,
              left: size.width * 0.6,
            ),
            Positioned(
              child: const _Bubble(),
              top: 10,
              left: size.width * 0.9,
            ),
          ],
        ));
  }

  BoxDecoration _customBoxDecoration() => const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(79, 79, 255, 1),
            Color.fromRGBO(42, 57, 255, 1),
          ],
        ),
      );
}

class _Bubble extends StatelessWidget {
  const _Bubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );
  }
}
