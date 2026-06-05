
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/models/listcard.dart';

class ThirdWidget extends StatelessWidget {
  final Listcard package;
  const ThirdWidget({required this.package});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(package.image), fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(package.name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF111827))),
                const SizedBox(height: 3),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Color(0xFFE53E3E), size: 11),
                    const SizedBox(width: 2),
                    Text(package.location, style: const TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
                    const Text(' • ', style: TextStyle(fontSize: 11, color: Color(0xFF9CA3AF))),
                    Text(package.price, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFF6366F1))),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: Color(0xFFFBBF24), size: 12),
                    const SizedBox(width: 3),
                    Text('${package.rating} (${package.reviews})', style: const TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

