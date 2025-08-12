import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  int _index(BuildContext context) {
    final loc = GoRouter.of(context).location;
    if (loc.startsWith('/journal')) return 1;
    if (loc.startsWith('/crisis')) return 2;
    if (loc.startsWith('/progress')) return 3;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return BottomNavigationBar(
      currentIndex: _index(context),
      onTap: (i) {
        switch (i) {
          case 0:
            router.go('/skills');
            break;
          case 1:
            router.go('/journal');
            break;
          case 2:
            router.go('/crisis');
            break;
          case 3:
            router.go('/progress');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Skills'),
        BottomNavigationBarItem(icon: Icon(Icons.note), label: 'Journal'),
        BottomNavigationBarItem(icon: Icon(Icons.warning), label: 'Crisis'),
        BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Progress'),
      ],
    );
  }
}
