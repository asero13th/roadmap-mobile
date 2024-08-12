import 'package:flutter/material.dart';

class HorizontalScrollableCard extends StatefulWidget {
  final AssetImage imageUrl;
  final String text;
  final Color color;
  final Color textColor;
  const HorizontalScrollableCard(
      {super.key,
      required this.imageUrl,
      required this.text,
      required this.color,
      required this.textColor});

  @override
  State<HorizontalScrollableCard> createState() =>
      _HorizontalScrollableCardState();
}

class _HorizontalScrollableCardState extends State<HorizontalScrollableCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.color,
      child: SizedBox(
        width: 220,
        height: 120,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 150,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: widget.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Spacer(),
              Wrap(
                spacing: 8.0,
                children: [
                  Chip(
                    label: Text(
                      widget.text,
                      style: TextStyle(color: widget.textColor),
                    ),
                    backgroundColor: Colors.white,
                    side: const BorderSide(width: 0, color: Colors.white),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
