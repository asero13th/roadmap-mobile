import 'package:flutter/material.dart';

class HorizontalScrolling extends StatefulWidget {
  const HorizontalScrolling({super.key});

  @override
  State<HorizontalScrolling> createState() => _HorizontalScrollingState();
}

class _HorizontalScrollingState extends State<HorizontalScrolling> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SizedBox(
        height: 160,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                  width: 280,
                  decoration: BoxDecoration(
                    color: Color(0xFFCEECFE).withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Dsa Roadmap',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Spacer(),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 40,
                              width: 125,
                              child: ElevatedButton(
                                onPressed: () => {},
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    backgroundColor: const Color(0xFFFF6905)),
                                child: const Text(
                                  ' Get Started',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Image.asset(
                        'assets/images/illustration_1.png',
                        width: 100, // Set the desired width
                        height: 100, // Set the desired height
                      ),
                    ],
                  )),
            );
          },
        ),
      ),
    );
  }
}
