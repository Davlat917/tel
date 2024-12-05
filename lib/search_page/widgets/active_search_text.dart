

import 'package:flutter/material.dart';

class HighlightedText extends StatelessWidget {
  final String text;
  final String query;
  final Color highlightColor;

  const HighlightedText({
    super.key,
    required this.text,
    required this.query,
    required this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    if (query.isEmpty) {
      return Text(text);
    }

    final queryLower = query.toLowerCase();
    final textLower = text.toLowerCase();

    final matches = <TextSpan>[];
    int start = 0;

    while (start < text.length) {
      final index = textLower.indexOf(queryLower, start);
      if (index == -1) {
        matches.add(TextSpan(text: text.substring(start)));
        break;
      }

      if (index > start) {
        matches.add(TextSpan(text: text.substring(start, index)));
      }

      matches.add(TextSpan(
        text: text.substring(index, index + query.length),
        style: TextStyle(
          color: Colors.black,
          backgroundColor: highlightColor,
        ),
      ));

      start = index + query.length;
    }

    return RichText(
      text: TextSpan(
        children: matches,
        style: DefaultTextStyle.of(context).style,
      ),
    );
  }
}
