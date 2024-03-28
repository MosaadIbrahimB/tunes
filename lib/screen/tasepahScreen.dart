import 'package:flutter/material.dart';




class TasbehScreen extends StatefulWidget {
  static const String nameRoute = "TasbehScreen";
  List<String> tasbeh = [
    "سُبْحَانَ اللَّهِ",
    "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ",
    "سُبْحَانَ اللَّهِ وَالْحَمْدُ لِلَّهِ",
    "سُبْحَانَ اللهِ العَظِيمِ وَبِحَمْدِهِ",
    "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ ، سُبْحَانَ اللَّهِ الْعَظِيمِ",
    "لَا إلَه إلّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلُّ شَيْءِ قَدِيرِ",
    "لا حَوْلَ وَلا قُوَّةَ إِلا بِاللَّهِ ",
    "الْحَمْدُ للّهِ رَبِّ الْعَالَمِينَ",
    "الْلَّهُم صَلِّ وَسَلِم وَبَارِك عَلَى سَيِّدِنَا مُحَمَّد",
    "أستغفر الله ",
    "سُبْحَانَ الْلَّهِ، وَالْحَمْدُ لِلَّهِ، وَلَا إِلَهَ إِلَّا الْلَّهُ، وَالْلَّهُ أَكْبَرُ",
    "لَا إِلَهَ إِلَّا اللَّهُ",
    "الْلَّهُ أَكْبَرُ",
    "سُبْحَانَ اللَّهِ ، وَالْحَمْدُ لِلَّهِ ، وَلا إِلَهَ إِلا اللَّهُ ، وَاللَّهُ أَكْبَرُ ، اللَّهُمَّ اغْفِرْ لِي ، اللَّهُمَّ ارْحَمْنِي ، اللَّهُمَّ ارْزُقْنِي.",
    "الْحَمْدُ لِلَّهِ حَمْدًا كَثِيرًا طَيِّبًا مُبَارَكًا فِيهِ",
    "اللَّهُ أَكْبَرُ كَبِيرًا ، وَالْحَمْدُ لِلَّهِ كَثِيرًا ، وَسُبْحَانَ اللَّهِ بُكْرَةً وَأَصِيلاً.",
    "اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ كَمَا صَلَّيْتَ عَلَى إِبْرَاهِيمَ , وَعَلَى آلِ إِبْرَاهِيمَ إِنَّكَ حَمِيدٌ مَجِيدٌ , اللَّهُمَّ بَارِكْ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ كَمَا بَارَكْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ إِنَّكَ حَمِيدٌ مَجِيدٌ.",
  ];
  @override
  State<TasbehScreen> createState() => _TasbehScreenState();
}

int numberOfTasbeh = 0;

class _TasbehScreenState extends State<TasbehScreen> {
  int currentIndex = 0;
  int round=0;

  void nextItem() {
    if (currentIndex < widget.tasbeh.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void previousItem() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[300],
      appBar: AppBar(
        backgroundColor: Color(0xfffdb64c),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: previousItem,
                      icon: Icon(Icons.arrow_back),
                    ),
                    Text('${widget.tasbeh[currentIndex]}'),
                    IconButton(
                      onPressed: nextItem,
                      icon: Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
              ),
              Text(
                '$numberOfTasbeh/32',
                style: const TextStyle(fontSize: 35),
              ),
               Text('round $round'),
              Row(
                children: [
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        numberOfTasbeh = 0;
                            round=0;
                      });
                    },
                    child: Text(
                      'Reset',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (numberOfTasbeh < 32) {
                      numberOfTasbeh++;
                    } else {
                      numberOfTasbeh = 0;
                      nextItem();
                      round++;
                    }

                  });
                },

                child: const CircleAvatar(
                  radius: 110,
                  backgroundColor: Colors.blue,
                  child: Text(
                    'سبح',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}