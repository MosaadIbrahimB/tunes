import 'package:flutter/material.dart';
class UIBtnSabahWidget extends StatefulWidget {
  var function;
  UIBtnSabahWidget({this.function});

  @override
  State<UIBtnSabahWidget> createState() => _UIBtnSabahWidgetState();
}
class _UIBtnSabahWidgetState extends State<UIBtnSabahWidget> {
  int c = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.function();

        if (c > 100) {
          setState(() {
            c = 0;
          });
        } else {
          setState(() {
            c = c + 10;
          });
        }

        print("cccccccccccccccc${c}");
      },
      child: CircleAvatar(
        radius: 83,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 80,
          backgroundColor: Color(0xff123456 + 4 * c),
          child: const Text(
            'سبح',
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

