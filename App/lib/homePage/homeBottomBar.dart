//https://www.youtube.com/watch?v=4c36HNckh8A
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectIndex = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    //scaffold (roof of app)
    return Scaffold(
      appBar: AppBar(
        title: Text('GFG Test'),
      ),
      body: PageView(
        controller: pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Stars'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Constalations')
      ],
      currentIndex: _selectIndex,
      // selectedItemColor: ,
      ),
    );
  }
}