import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.music_note),label: 'Tala'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_outlined),label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
        ],
        

      ),

    );
  }
}
