import 'package:flutter/material.dart';
class NivgaterScreenList extends StatelessWidget {
  NivgaterScreenList(this.imageName);
  String imageName="";
  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: 100,
      width: 100,
      child: CircleAvatar(
        child:  ClipRRect(
          borderRadius: new BorderRadius.circular(100.0),
          child:Image.asset(imageName,fit: BoxFit.fill,),
        ),),
    );
  }
}