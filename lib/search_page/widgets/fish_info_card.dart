



import 'package:flutter/material.dart';
import 'package:test_app/search_page/widgets/active_search_text.dart';

class FishInfoCard extends StatelessWidget {
  const FishInfoCard({
    super.key,
    required this.name,
    required this.searchController,
  });

  final String name;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.indigo, Colors.blueAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "FISH:",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Icon(
                  Icons.account_circle_rounded,
                  size: 30,
                  color: Colors.white.withOpacity(0.8),
                ),
              ],
            ),
            const SizedBox(height: 10),
            HighlightedText(
              text: name,
              query: searchController.text,
              highlightColor: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}
