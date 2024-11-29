import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomepageScaffold extends StatelessWidget {
  final Widget child;

  const HomepageScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        height: 64,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: const Color(0x33000000),
              offset: const Offset(0, -2),
            )
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _calculateSelectedIndex(context),
          onTap: (index) => _onTap(context, index),
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart, color: Color(0xFF001A47), size: 32),
              label: "Reports"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color(0xFF001A47), size: 32),
              label: "Home"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Color(0xFF001A47), size: 32),
              label: "User Profile"
            ),
          ],
        ),
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String? location = GoRouter.of(context).state?.path;
    if (location!.startsWith('/null')) return 0;
    if (location.startsWith('/home')) return 1;
    if (location.startsWith('/user')) return 2;
    return 0;
  }

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/null');
        break;
      case 1:
        context.go('/home');
        break;
      case 2:
        context.go('/user');
        break;
    }
  }
}
