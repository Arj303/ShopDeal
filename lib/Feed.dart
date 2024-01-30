import 'package:buyrent/ProfilePage.dart';
import 'package:buyrent/buypage.dart';
import 'package:buyrent/chatpage.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    PlaceholderWidget(Colors.white, 'Screen 1'),
    PlaceholderWidget(Colors.white, 'Screen 2'),
    PlaceholderWidget(Colors.white, 'Screen 3'),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.home),
              onPressed: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BuyPage()),
                );
              },
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.chat),
              onPressed: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChatPage()),
                );
              },
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.manage_accounts),
              onPressed: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfilePage()),
                );
              },
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;
  final String title;

  PlaceholderWidget(this.color, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

