import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color c;
  final Widget cardchild;
  final VoidCallback? onpress ;
  ReusableCard({required this.c,required this.cardchild, this.onpress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: cardchild,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: c,
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );
  }
}
