import 'package:flutter/material.dart';
import 'package:wordpair_generator/screens/homepage.dart';
import 'package:wordpair_generator/screens/about.dart';
import 'package:wordpair_generator/screens/profile.dart';

final List<Map<String, dynamic>> routes = [
  {'path': '/', 'title': 'Home', 'screen': const HomePage()},
  {'path': '/profile', 'title': 'Profile', 'screen': const ProfileScreen()},
  {'path': '/about', 'title': 'Settings', 'screen': const About()},
];

void navigateTo(BuildContext context, String path, {dynamic arguments}) {
  final route = routes.firstWhere((route) => route['path'] == path);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => route['screen'],
      settings: RouteSettings(
        arguments: arguments,
      ),
    ),
  );
  // Navigator.pushNamed(
  //   context,
  //   route['path'],
  //   arguments: arguments,
  // );
}

Map<String, dynamic> getArguments(BuildContext context) {
  final args =
      ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
  return args;
}
