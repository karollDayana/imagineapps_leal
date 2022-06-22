import 'package:flutter/material.dart';
import 'package:imagineapps_leal/presentation/presentation.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  int currentIndex = 0;
  final List<Widget> pages = const [
    HomeScreen(),
    FavoriteScreen(),
    RecentScreen(),
    SearchScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primaryContainer,
        title: TextWidget(
          text: currentIndex == 0
              ? 'Home'
              : currentIndex == 1
                  ? 'Favorites'
                  : currentIndex == 2
                      ? 'Recent'
                      : 'Search',
          style: theme.textTheme.bodyText1?.copyWith(color: theme.colorScheme.secondaryContainer),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            color: theme.colorScheme.secondaryContainer,
            onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('/welcomeScreen', (route) => false),
          )
        ],
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: theme.colorScheme.primaryContainer,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: theme.textTheme.caption?.copyWith(color: theme.colorScheme.primary),
        unselectedLabelStyle: theme.textTheme.caption,
        unselectedItemColor: theme.colorScheme.secondary,
        onTap: (index) => setState(() => currentIndex = index),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: theme.colorScheme.secondaryContainer, size: 30),
            activeIcon: Icon(Icons.home_outlined, color: theme.colorScheme.primary, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border, color: theme.colorScheme.secondaryContainer, size: 30),
            activeIcon: Icon(Icons.favorite_border, color: theme.colorScheme.primary, size: 30),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_backup_restore_outlined, color: theme.colorScheme.secondaryContainer, size: 30),
            activeIcon: Icon(Icons.settings_backup_restore_outlined, color: theme.colorScheme.primary, size: 30),
            label: 'Recent',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: theme.colorScheme.secondaryContainer, size: 30),
            activeIcon: Icon(Icons.search, color: theme.colorScheme.primary, size: 30),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}
