import 'package:flutter/material.dart';

class SuccessErrorOverlay extends StatefulWidget {
  final bool isCorrect;
  final VoidCallback onTap;
  final Color successColor;
  final Color backgroundColor;
  final Color errorColor;
  final String successText;
  final String ndSuccessText;
  final Color successTextColor;
  final String errorText;
  final String ndErrorText;
  final Color errorTextColor;

  SuccessErrorOverlay(
      {@required this.isCorrect,
      @required this.onTap,
      this.backgroundColor = Colors.black54,
      this.successColor = Colors.green,
      this.errorColor = Colors.red,
      this.successText = "Success!",
      this.ndSuccessText = "",
      this.successTextColor = Colors.green,
      this.errorText = "Error Happened",
      this.ndErrorText = "",
      this.errorTextColor = Colors.red});

  @override
  State createState() => SuccessErrorOverlayState();
}

class SuccessErrorOverlayState extends State<SuccessErrorOverlay>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    _iconAnimation = CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.elasticOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.backgroundColor,
      child: InkWell(
        onTap: () => widget.onTap(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Transform.rotate(
                angle: _iconAnimation.value * 2 * 3.14,
                child: Icon(
                  widget.isCorrect == true ? Icons.done : Icons.clear,
                  size: _iconAnimation.value * 80.0,
                  color: widget.isCorrect
                      ? widget.successColor
                      : widget.errorColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0), //rgb(57,181,74)
            ),
            Text(
              widget.isCorrect ? widget.successText : widget.errorText,
              style: TextStyle(
                color: widget.isCorrect
                    ? widget.successTextColor
                    : widget.errorTextColor,
                fontSize: 30.0,
              ),
            ),
            Text(
              widget.isCorrect ? widget.ndSuccessText : widget.ndErrorText,
              style: TextStyle(
                color: widget.isCorrect
                    ? widget.successTextColor
                    : widget.errorTextColor,
                fontSize: 30.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
