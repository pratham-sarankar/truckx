import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContinueButton extends StatefulWidget {
  const ContinueButton(
      {super.key, required this.onTap, this.text = "Continue"});
  final Function onTap;
  final String text;
  @override
  ElevatedButtonWithAnimationState createState() =>
      ElevatedButtonWithAnimationState();
}

class ElevatedButtonWithAnimationState extends State<ContinueButton> {
  double _iconOffset = 0.0;
  bool isHovered = false;

  void _updateIconOffset(double newOffset) {
    setState(() {
      _iconOffset = newOffset;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        // Update icon offset during drag on mobile
        _updateIconOffset(details.localPosition.dx);
      },
      onHorizontalDragEnd: (details) {
        // Reset icon offset when drag ends on mobile
        _updateIconOffset(0.0);
      },
      child: InkWell(
        onTapDown: (details) {
          // Update icon offset when tap down
          _updateIconOffset(10.0); // Adjust the initial offset for tap down
        },
        onTapUp: (details) {
          // Reset icon offset when tap up
          _updateIconOffset(0.0);
        },
        onTapCancel: () {
          // Reset icon offset on tap cancel
          _updateIconOffset(0.0);
        },
        onHover: (isHovered) {
          // Update hover status on desktop
          setState(() {
            isHovered = isHovered;
          });
        },
        child: ElevatedButton(
          onPressed: () {
            widget.onTap();
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.text),
              const SizedBox(width: 8),
              AnimatedContainer(
                duration: const Duration(
                    milliseconds: 200), // Adjust the animation duration
                curve: Curves.easeInOut, // Adjust the animation curve
                transform: Matrix4.translationValues(_iconOffset, 0.0, 0.0),
                child: const Icon(CupertinoIcons.arrow_right, size: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
