import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_g/presentation/post/post_page.dart';
import 'package:team_g/presentation/profile/profile_page.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({Key? key}) : super(key: key);
  @override
  _BottomPagetate createState() => _BottomPagetate();
}

class _BottomPagetate extends State<BottomPage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  List<BottomNavigationBarItem> _bottomNavigationBarItems = [];

  final _footerItem = [
    const PostPage(),
    const ProfilePage(),
  ];

  void _setBottomNavigationBarItems() {
    _bottomNavigationBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Icon(Icons.post_add), label: 'Post'),
      const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    ];
  }

  @override
  void initState() {
    super.initState();
    _setBottomNavigationBarItems();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _footerItem.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _bottomNavigationBarItems,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black87,
      ),
    );
  }
}