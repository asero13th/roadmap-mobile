import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LearningPlan extends StatefulWidget {
  const LearningPlan({super.key});

  @override
  State<LearningPlan> createState() => _LearningPlanState();
}

class _LearningPlanState extends State<LearningPlan> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Learning Plans',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 110,
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 6,
                        offset: const Offset(0, 2))
                  ]),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, top: 20, right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(children: <Widget>[
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              value: 0.7, // Set the progress value (0.0 to 1.0)
                              backgroundColor: Colors.grey[300],
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.blue),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Jazz Piano',
                            style: TextStyle(
                              color: Color(0xFF858597),
                              fontSize: 15,
                            ),
                          )
                        ]),
                        const Spacer(),
                        // TODO: Add the Row widget
                        const Padding(
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
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, top: 10, right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(children: <Widget>[
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              value: 0.7, // Set the progress value (0.0 to 1.0)
                              backgroundColor: Colors.grey[300],
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.blue),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Jazz Piano',
                            style: TextStyle(
                              color: Color(0xFF858597),
                              fontSize: 15,
                            ),
                          )
                        ]),
                        const Spacer(),
                        // TODO: Add the Row widget
                        const Padding(
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
