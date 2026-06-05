import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/first_card.dart';

class FirstCardWidget extends StatefulWidget {
  final FirstCard card;

   FirstCardWidget({required this.card});

  @override
  State<FirstCardWidget> createState() => _FirstCardWidgetState();
}

class _FirstCardWidgetState extends State<FirstCardWidget> {
  bool _isSaved = false;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 210,
      height: 260,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 16, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(top: 5, right: 5, left: 5),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(widget.card.image), fit: BoxFit.cover),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 6)],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star_rounded, color: Color(0xFFFFA726), size: 16),
                          const SizedBox(width: 4),
                          Text("${widget.card.rating}", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black87)),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    right: 12,
                    child: GestureDetector(
                      onTap: () => setState(() => _isSaved = !_isSaved),
                      child: AnimatedContainer(
                        duration:  Duration(milliseconds: 150),
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: _isSaved ? Colors.blue : Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),

                        ),
                        child:Icon(
                          _isSaved?Icons.bookmark_rounded:Icons.bookmark_border_outlined,
                          color:  Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.card.name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black87)),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_on_rounded, color: Color(0xFFFF5252), size: 14),
                          const SizedBox(width: 3),
                          Text(widget.card.location, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
                        ],
                      ),
                      Text(widget.card.price, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Color(0xFF2EB0E4))),
                    ],
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