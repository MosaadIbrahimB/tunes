import 'package:flutter/material.dart';
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
