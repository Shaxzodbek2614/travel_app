import 'package:flutter/material.dart';
import 'package:travel_app/models/second_card.dart';


class SecondWidget extends StatefulWidget {
  final SecondCard item;
  const SecondWidget({super.key, required this.item});

  @override
  State<SecondWidget> createState() => _SecondWidgetState();
}

class _SecondWidgetState extends State<SecondWidget> {
  bool _isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: .all(width: 3,color: Colors.grey)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              widget.item.image,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: const Color(0xFF6B9BD2),
                child: const Icon(Icons.landscape, color: Colors.white54, size: 64),
              ),
            ),
            Positioned(
              top: 14,
              left: 14,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 2))],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star_rounded, color: Color(0xFFFFC107), size: 18),
                    const SizedBox(width: 4),
                    Text(widget.item.rating.toStringAsFixed(1), style: const TextStyle(color: Color(0xFF1A1A1A), fontSize: 14, fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF4A90D9).withOpacity(0.25)
                ),
              ),
            Positioned(
              bottom: 14,
              left: 16,
              right: 16,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.item.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.3,
                            shadows: [Shadow(color: Colors.black38, blurRadius: 8)],
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(widget.item.subtitle, style: TextStyle(color: Colors.white.withOpacity(0.85), fontSize: 13)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => _isSaved = !_isSaved),
                    child: AnimatedContainer(
                      duration:  Duration(milliseconds: 150),
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: _isSaved ? Colors.blue : Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.white.withOpacity(0.4), width: 1),
                      ),
                      child: Icon(
                        _isSaved?Icons.bookmark_rounded:Icons.bookmark_border_outlined,
                        color:  Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}