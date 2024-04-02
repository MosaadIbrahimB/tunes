import 'package:flutter/material.dart';
class NivgaterScreenListwidget extends StatelessWidget {

  NivgaterScreenListwidget(this.imageName,this.title);
  String imageName="";
  String title="";
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 50,
          child: ClipOval(
            child: Image.asset(
              imageName,
              fit: BoxFit.cover,
              width: 96,
              height: 96,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(.5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.yellow)
          
        ),
            child: Text(title,style: textStyle(),),
        )
      ],
    );
  }
  textStyle(){
    return const TextStyle(
      color: Colors.white,
fontWeight: FontWeight.bold,
      fontSize: 16,
    );
  }

}
//Image.asset(imageName,fit: BoxFit.fill,)