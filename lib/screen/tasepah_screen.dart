import 'package:flutter/material.dart';

import '../shared/tasbeh_shared.dart';
import '../widget/tasbeh_widget/number_tasbeh_widget.dart';
import '../widget/tasbeh_widget/ui_btn_sabah_widget.dart';

class TasbehScreen extends StatefulWidget {
  static const String nameRoute = "TasbehScreen";
  List<String> tasbeh = TasbehShared.tasbeh;
  @override
  State<TasbehScreen> createState() => _TasbehScreenState();
}

class _TasbehScreenState extends State<TasbehScreen> {
  int currentIndex = 0;
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
