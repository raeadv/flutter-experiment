import 'package:flutter/material.dart';
import 'package:wordpair_generator/navigation/appdrawer.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text('Settings'),
      ),
    );
  }
}
