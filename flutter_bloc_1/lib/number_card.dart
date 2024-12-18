import 'package:flutter/material.dart';

class NumberCard extends StatelessWidget {
  final String? title;
  final int? number;

  const NumberCard({super.key, this.title, this.number});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue[200],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Center(
              child: Text(
                "$title",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            width: 70,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue[80],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Center(
              child: Text(
                number != null ? '$number' : '-',
                style: const TextStyle(fontSize: 30),
              ),
            ),
          )
        ],
      ),
    );
  }
}
