import 'package:flutter/material.dart';
import 'package:wordpair_generator/navigation/routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: const Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          for (final route in routes)
            ListTile(
              title: Text(route['title']),
              onTap: () {
                // Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => route['screen'],
                    ));
              },
            ),
        ],
      ),
    );
  }
}
