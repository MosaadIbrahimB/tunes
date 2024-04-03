import 'package:flutter/material.dart';

import '../shared/tasbeh_shared.dart';

class TasbehScreen extends StatefulWidget {
  static const String nameRoute = "TasbehScreen";
  List<String> tasbeh = TasbehShared.tasbeh;
  @override
  State<TasbehScreen> createState() => _TasbehScreenState();
}

class _TasbehScreenState extends State<TasbehScreen> {
  int currentIndex = 0;
  int l = 0;
  int numberOfTasbeh = 0;
  int allNumberOfTasbeh = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[300],
      appBar: AppBar(
        backgroundColor: const Color(0xfffdb64c),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .25,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white, width: 4)),
              child: Row(
                children: [
                  Expanded(
                    child: IconButton(
                      onPressed: previousItem,
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 8,
                      child: GestureDetector(
                        onTap: () {
                          onTapTasbeh();
                        },
                        child: Center(
                            child: Text(
                          textDirection: TextDirection.rtl,
                          widget.tasbeh[currentIndex],
                          style: textStyle(),
                        )),
                      )),
                  Expanded(
                    child: IconButton(
                      onPressed: nextItem,
                      icon:
                          const Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            //عدد التسبيحات
            NumberTasbehWidget(
              number: numberOfTasbeh,
              text: ':عدد التسبيحات',
              numberLimtedTasbehText: "20 /",
            ),
            const SizedBox(height: 30),
            //اجمالى التسبيحات
            NumberTasbehWidget(
              number: allNumberOfTasbeh,
              text: ':أجمالى التسبيحات',
            ),
            const SizedBox(height: 40),
            //الاعادة
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.black.withOpacity(.2),
                  side: const BorderSide(color: Colors.white, width: 2)),
              onPressed: () {
                setState(() {
                  numberOfTasbeh = 0;
                  allNumberOfTasbeh = 0;
                });
              },
              child: const Text(
                'الاعادة',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
            const SizedBox(height: 40),

            UIBtnSabahWidget(
              function: onTapTasbeh,
            )
          ],
        ),
      ),
    );
  }

  textStyle() {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 28,
    );
  }

  void nextItem() {
    if (currentIndex < widget.tasbeh.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      setState(() {
        currentIndex = 0;
      });
    }
  }

  void previousItem() {
    setState(() {
      if (currentIndex == 0) {
        currentIndex = widget.tasbeh.length - 1;
      } else {
        currentIndex--;
      }
    });
  }

  void onTapTasbeh() {
    setState(() {
      allNumberOfTasbeh++;
      if (numberOfTasbeh < 20) {
        numberOfTasbeh++;
      } else {
        numberOfTasbeh = 0;
        allNumberOfTasbeh -= 1;
        nextItem();
      }
    });
  }
}

class NumberTasbehWidget extends StatelessWidget {
  const NumberTasbehWidget({
    super.key,
    required this.number,
    required this.text,
    this.numberLimtedTasbehText = "",
  });

  final int number;
  final String text;
  final String? numberLimtedTasbehText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .2),
      decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white, width: 2)),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$numberLimtedTasbehText  $number",
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(width: 15),
          Text(
            "$text ",
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

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
