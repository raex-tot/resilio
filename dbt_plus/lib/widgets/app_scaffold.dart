import 'package:flutter/material.dart';

import 'bottom_nav.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.title, required this.body, this.showNav = true});
  final String title;
  final Widget body;
  final bool showNav;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: body,
      bottomNavigationBar: showNav ? const BottomNav() : null,
    );
  }
}
