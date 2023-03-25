// create simple dart page widget
// Path: lib/screens/homepage.dart
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:wordpair_generator/screens/savedword.dart';

import '../navigation/appdrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  RandomWords createState() => RandomWords();
}

class RandomWords extends State<HomePage> {
  final _randomWordPairs = <WordPair>[];
  final _savedWordPairs = <WordPair>{};

  Widget _buidList() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, item) {
        if (item.isOdd) return const Divider();

        final index = item ~/ 2;
        if (index >= _randomWordPairs.length) {
          _randomWordPairs.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_randomWordPairs[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final isSaved = _savedWordPairs.contains(pair);

    var subtitleContent = isSaved
        ? const Text(
            'Fav',
            style: TextStyle(color: Colors.lightGreen),
          )
        : null;

    var trailingContent = Icon(
      isSaved ? Icons.favorite : Icons.favorite_border,
      color: isSaved ? Colors.green : null,
    );

    void toggleWords() {
      setState(() {
        if (isSaved) {
          _savedWordPairs.remove(pair);
        } else {
          _savedWordPairs.add(pair);
        }
      });
    }

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: const TextStyle(fontSize: 18),
      ),
      subtitle: subtitleContent,
      trailing: trailingContent,
      onTap: toggleWords,
    );
  }

  void toSavedWords() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return SavedWord(savedList: _savedWordPairs);
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Random Wordpair Generator',
            textAlign: TextAlign.center,
          ),
          titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              textBaseline: TextBaseline.ideographic),
          actions: [
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: toSavedWords,
            )
          ]),
      drawer: const AppDrawer(),
      body: _buidList(),
    );
  }
}
