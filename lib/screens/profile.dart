import 'package:flutter/material.dart';

import '../navigation/appdrawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text('Profile'),
      ),
    );
  }
}
