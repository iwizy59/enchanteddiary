import 'package:enchanteddiary/emotion/emotion.dart';
import 'package:enchanteddiary/footer.dart';
import 'package:enchanteddiary/header/header.dart';
import 'package:enchanteddiary/search/result_page.dart';
import 'package:enchanteddiary/statistiques.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _selectedEmoji = 'All';
  TextEditingController _textFieldController = TextEditingController();

  @override
  void dispose() {
    _textFieldController
        .dispose(); // Disposez du contrôleur lorsque le widget est supprimé
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
        appBar: CustomHeader(appBarColor: Colors.white),
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
                        "Tu cherches quelque chose... 🔎",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
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
                          hintText: "Whispers of Moonlight"),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Une émotion particulière ?",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
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
                            child: Text("🌈  Toutes les émotions"),
                          ),
                          ...emojiMap.keys.map((String emoji) {
                            return DropdownMenuItem<String>(
                              value: emoji,
                              child: Row(
                                children: <Widget>[
                                  Text(emoji),
                                  SizedBox(width: 10),
                                  Text(emojiMap[emoji]!),
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
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                        child: Text("Rechercher"),
                      ),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(0, 80, 134, 1)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                          color:
                                              Color.fromRGBO(0, 80, 134, 1))))),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: EnchantedStats(),
              ),
            ],
          ),
        ));
  }
}
