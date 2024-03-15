import 'package:flutter/material.dart';

class EmojiMap extends StatefulWidget {
  final Function(Color) updateColor;

  EmojiMap(this.updateColor);
  @override
  _EmojiMapState createState() => _EmojiMapState();
}

class _EmojiMapState extends State<EmojiMap> {
  String? selectedEmoji;
  Map<String, String> emojiMap = {
    '🤩': 'Excited',
    '😊': 'Happy',
    '😐': 'Meh',
    '😢': 'Sad',
    '😡': 'Frustated',
  };

  Map<String, Color> colorMap = {
    'Excited': Color.fromRGBO(252, 171, 16, 1.0),
    'Happy': Color.fromRGBO(180, 235, 202, 1.0),
    'Sad': Color.fromRGBO(188, 244, 245, 1.0),
    'Meh': Color.fromRGBO(180, 160, 229, 1.0),
    'Frustated': Color.fromRGBO(255, 183, 195, 1.0)
  };

  @override
  void updateSelectorColor(Color color) {
    widget.updateColor(color);
  }
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: emojiMap.keys.map((emoji) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedEmoji = emoji;
            });
            widget.updateColor(colorMap[emojiMap[emoji]!] ?? Colors.cyan);
            updateSelectorColor(colorMap[emojiMap[emoji]!] ?? Colors.cyan);
          },
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  emoji,
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
              if (selectedEmoji == emoji)
                Text(
                  emojiMap[emoji]!.toUpperCase(),
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF001244),
                  ),
                ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
