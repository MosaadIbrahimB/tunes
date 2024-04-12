import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dowa_provider_model.dart';
import '../widget/doaa_widget/playe_widget.dart';

class DowaScreen extends StatefulWidget {
  static const String nameRoute = "DowaScreen";

  @override
  State<DowaScreen> createState() => _DowaScreenState();
}

class _DowaScreenState extends State<DowaScreen> {
  List<String> listNameDoaa = DowaProviderModel.listNameDoaa;

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero).then((value) {
          Provider.of<DowaProviderModel>(context, listen: false).init();
    });
    super.initState();
  }

  @override
  void dispose() {
    DowaProviderModel.player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DowaProviderModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          size: 30
        ),
        backgroundColor:Colors.grey[300],
        title: Text(listNameDoaa[provider.index],style:
          const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22
          )
          ,),
        centerTitle: true,
        // toolbarHeight: 30,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            const SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 55),
                itemCount: DowaProviderModel.listNameFileSound.length,
                itemBuilder: (c, i) {
                  return InkWell(
                    onTap: () {
                      provider.onClick(i);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      decoration: BoxDecoration(
                          color: provider.index == i ? Colors.grey[600] : null,
                          border: Border.all(color:  provider.index == i ?
                          Colors.orange:
                              Colors.black26,
                            width: 1.5
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                            //-----text--دعاء التراويح
                            Expanded(
                              child: Text(
                                listNameDoaa[i],
                                style: TextStyle(
                                    fontSize: 20,
                                    color: provider.index == i
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            //           دى هتتغير و هتتربط مع player
                            CircleAvatar(
                                // backgroundColor: Colors.transparent,
                                radius: 24,
                                backgroundColor: provider.index == i
                                    ? Colors.blue
                                    : Colors.transparent,
                                // ---- مفتاح التشغيل
                                child: Icon(
                                  provider.isPlay
                                      ? Icons.pause_circle
                                      : Icons.play_circle,
                                  size: 40,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: PlayerWidget(),
    );
  }
}
