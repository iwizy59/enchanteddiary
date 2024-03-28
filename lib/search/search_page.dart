import 'package:enchanteddiary/emotion/emotion.dart';
import 'package:enchanteddiary/footer.dart';
import 'package:enchanteddiary/header/header.dart';
import 'package:enchanteddiary/search/result_page.dart';
import 'package:enchanteddiary/statistiques.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final Color darkBlue = Color(0xFF001244);
  final Color lightBlue = Color(0xFF005086);
  final Color skyBlue = Color(0xFF318fb5);
  final Color lightGray = Color(0xFFb0cac7);
  final Color lightYellow = Color(0xFFf7d6bf);

  String _selectedEmoji = 'All';
  TextEditingController _textFieldController = TextEditingController();

  @override
  void dispose() {
    _textFieldController.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        width: double.infinity,
        color: Colors.grey[200],
        child: Footer(),
      ),
      appBar: CustomHeader(),
      backgroundColor: lightYellow,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "looking for a chain of memory... 🔎",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          color: Colors.black),
                    ),
                  ),
                  TextField(
                    controller: _textFieldController,
                    style: TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14)),
                      hintText: "Whispers of Moonlight",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10), 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "reminiscining an emotion? 🌠",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        color: Colors.black),
                  ),
                ),
                InputDecorator(
                  decoration: const InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 0, horizontal: 15.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14))),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedEmoji,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedEmoji = newValue!;
                        });
                      },
                      items: [
                        DropdownMenuItem(
                          value: "All",
                          child: Text("🌈 All of them", style: TextStyle(fontFamily: 'Poppins'),),
                        ),
                        ...emojiMap.keys.map((String emoji) {
                          return DropdownMenuItem<String>(
                            value: emoji,
                            child: Row(
                              children: <Widget>[
                                Text(emoji),
                                SizedBox(width: 10),
                                Text(emojiMap[emoji]!, style: TextStyle(fontFamily: 'Poppins'),),
                              ],
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                String textFieldValue = _textFieldController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchResultPage(
                      emoji: _selectedEmoji,
                      initialSearchEntry: textFieldValue,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("⚡ Memento ⚡",
                style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: skyBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EnchantedStats(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "You may want to go through our enchanted selection of stats",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: skyBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
