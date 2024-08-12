import 'package:flutter/material.dart';

class LearningPlanCard extends StatelessWidget {
  const LearningPlanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 20.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '60' + 'min',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            ' / ',
            style: TextStyle(
              color: Color(0xFF858597),
              fontSize: 15,
            ),
          ),
          Text(
            '120' + 'min',
            style: TextStyle(
              color: Color(0xFF858597),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
