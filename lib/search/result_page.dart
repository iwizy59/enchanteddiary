import 'package:enchanteddiary/add_entry/add_entry.dart';
import 'package:enchanteddiary/database/data_sources/note_data_source.dart';
import 'package:enchanteddiary/database/models/note_model.dart';
import 'package:enchanteddiary/emotion/emotion.dart';
import 'package:enchanteddiary/header/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class SearchResultPage extends StatefulWidget {
  final String emoji;
  final String initialSearchEntry;

  const SearchResultPage({
    Key? key,
    required this.emoji,
    required this.initialSearchEntry,
  }) : super(key: key);

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  final Color darkBlue = Color(0xFF001244);
  final Color lightBlue = Color(0xFF005086);
  final Color skyBlue = Color(0xFF318fb5);
  final Color lightGray = Color(0xFFb0cac7);
  final Color lightYellow = Color(0xFFf7d6bf);

  TextEditingController _textFieldController = TextEditingController();
  String localSearchResult = "";
  bool isSearching = false;
  List<Note> searchResults = [];

  Future<void> fetchData() async {
    isSearching = true;

    NoteDataSource.searchNotes(
            getColorFromEmoji(widget.emoji), localSearchResult)
        .then((List<Note> result) {
      setState(() {
        searchResults = result;
      });
    });

    isSearching = false;
  }

  @override
  void initState() {
    super.initState();
    localSearchResult = widget.initialSearchEntry;
    _textFieldController.text = localSearchResult;
    fetchData();
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(),
      backgroundColor: lightYellow,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _textFieldController,
                    onChanged: (text) {
                      setState(() {
                        localSearchResult = text;
                      });
                      fetchData();
                    },
                    style: TextStyle(fontSize: 13, fontFamily: 'Poppins'),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 15.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14)),
                        hintText: "My dearly beloved Alexis..."),
                  ),
                ],
              ),
            ),
            Expanded(
              child: isSearching
                  ? Center(
                      child:
                          CircularProgressIndicator(),
                    )
                  : searchResults.isEmpty
                      ? Center(
                          child: Text("There's no such result 😭", style: TextStyle(fontFamily: 'Poppins')),
                        )
                      : ListView.builder(
                          itemCount: searchResults.length,
                          itemBuilder: (context, index) {
                            final item = searchResults[index];
                            return Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Color.fromRGBO(0, 80, 134,
                                        1),
                                    width: 2.0, 
                                  ),
                                ),
                              ),
                              child: ListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AddEntryWidget(
                                            dateToAddEntry: item.date),
                                      ),
                                    );
                                  },
                                  title: ClipRRect(
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 70,
                                            child: Text(
                                              DateFormat('dd/MM/yyyy')
                                                  .format(item.date),
                                              maxLines: 1,
                                              style: TextStyle(
                                                  color: darkBlue,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  item.title,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: darkBlue),
                                                ),
                                                Text(item.text,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        color: skyBlue))
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                            );
                          },
                        ),
            )
          ],
        ),
      ),
    );
  }
}
