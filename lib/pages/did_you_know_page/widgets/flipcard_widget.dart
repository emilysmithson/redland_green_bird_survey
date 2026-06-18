import 'dart:math';

import 'package:flutter/material.dart';
import '../../../models/dyk.dart';

import '../../../settings.dart';

class FlipCardWidget extends StatefulWidget {
  final DYK? dyk;

  const FlipCardWidget({super.key, this.dyk});

  @override
  _FlipCardWidgetState createState() => _FlipCardWidgetState();
}

class _FlipCardWidgetState extends State<FlipCardWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(end: 1, begin: 0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _animationStatus = status;
      });
    super.initState();
  }

  Widget _widget() {
    return Container(
      decoration: defaultBoxDecoration(),
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      height: MediaQuery.of(context).size.width / 2,
      child: (_animation.value < 0.5)
          ? ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Row(
                children: [
                  Flexible(
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.asset(widget.dyk!.image!, fit: BoxFit.cover),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      color: Colors.green[50],
                      width: double.infinity,
                      height: double.infinity,
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          widget.dyk!.question!,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                    ),
                  ),
                ],
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
                      child: SingleChildScrollView(
                        child: Text(widget.dyk!.answer!),
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
    return GestureDetector(
      onTap: () {
        if (_animationStatus == AnimationStatus.dismissed) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }
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
