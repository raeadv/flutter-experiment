import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import '../navigation/appdrawer.dart';

class SavedWord extends StatefulWidget {
  final Set<WordPair> savedList;

  const SavedWord({Key? key, required this.savedList}) : super(key: key);

  @override
  _SavedWordState createState() => _SavedWordState();
}

class _SavedWordState extends State<SavedWord> {
  @override
  Widget build(BuildContext context) {
    final savedWordPairs = widget.savedList;

    final tiles = savedWordPairs.map(
      (WordPair pair) {
        return ListTile(
            title: Text(
              pair.asPascalCase,
              style: const TextStyle(fontSize: 16),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => setState(() {
                savedWordPairs.remove(pair);
              }),
            ));
      },
    );

    final divided = tiles.isNotEmpty
        ? ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList()
        : <Widget>[];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Wordpairs'),
      ),
      drawer: AppDrawer(),
      body: ListView(children: divided),
    );
  }
}
