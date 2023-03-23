import 'package:flutter/material.dart';

class ImagePlaceHolder extends StatefulWidget {
  const ImagePlaceHolder({super.key});

  @override
  State<ImagePlaceHolder> createState() => _ImagePlaceHolderState();
}

class _ImagePlaceHolderState extends State<ImagePlaceHolder>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late Animation<double> fadeInOut;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    fadeInOut = Tween<double>(begin: 0.4, end: 1.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutCubic));
    animationController.forward();
    animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeInOut,
      child: Container(
        width: double.infinity,
        height: 100,
        color: Colors.grey,
      ),
    );
  }
}
