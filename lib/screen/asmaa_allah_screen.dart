import 'package:flutter/material.dart';

import '../shared/asmaa_allah_shared.dart';


class AsmaAllahScreen extends StatelessWidget {
  static const String nameRoute = "AsmaAllahScreen";



  @override
  Widget build(BuildContext context) {
    List<String> data=AsmaaAllahShared.data;

    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(elevation: 0,
        title: const Text(
          'اسماء الله الحسني',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange[200],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 6),
              margin: const EdgeInsets.only(bottom: 6,left: 4,right: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black26
                ),
                child: Text(data[index],


                style: TextStyle(
                  fontSize: 22,
                  color: Colors.blueGrey[800],
                  fontWeight: FontWeight.bold
                ),
                ),



            );
          },
        ),
      ),
    );
  }
}
