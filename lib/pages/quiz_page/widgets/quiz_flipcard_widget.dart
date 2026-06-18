import 'dart:math';

import 'package:flutter/material.dart';

import '../../../settings.dart';

class QuizFlipCardWidget extends StatefulWidget {
  final String image;
  final bool correct;
  final String answer;
  final Function onTap;

  const QuizFlipCardWidget({
    super.key,
    required this.image,
    required this.correct,
    required this.answer,
    required this.onTap,
  });

  @override
  _QuizFlipCardWidgetState createState() => _QuizFlipCardWidgetState();
}

class _QuizFlipCardWidgetState extends State<QuizFlipCardWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  late String currentImage;
  @override
  void initState() {
    currentImage = widget.image;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(end: 1, begin: 0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  Widget _widget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: defaultBoxDecoration(),
        child: (_animation.value < 0.5)
            ? ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(widget.image, fit: BoxFit.cover),
                ),
              )
            : Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Transform(
                      alignment: FractionalOffset.center,
                      transform: Matrix4.identity()..rotateY(pi),
                      child: Transform.scale(
                        scale: 1,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              widget.correct
                                  ? const Icon(Icons.check, color: Colors.green)
                                  : const Icon(Icons.close, color: Colors.red),
                              const SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                  widget.correct
                                      ? 'Correct this is a ${widget.answer}'
                                      : 'Wrong, this is a ${widget.answer}',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (currentImage != widget.image) {
      _animationController.reset();
      currentImage = widget.image;
    }
    return GestureDetector(
      onTap: () {
        _animationController.forward();
        widget.onTap(widget.correct);
      },
      child: Transform(
        transform: Matrix4.identity()..rotateY(pi * _animation.value),
        alignment: FractionalOffset.center,
        child: _widget(),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
