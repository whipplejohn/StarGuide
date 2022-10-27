//https://www.youtube.com/watch?v=z9d7c3W_evM
//you can change to bottom just look at video
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
    return DefaultTabController(
      length: 3, 
      child: Scaffold(
        appBar: AppBar(
          title: Text("Top Navagation test"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Stars", icon: Icon(Icons.star_outline)),               //Tab1
              Tab(text: "Home", icon: Icon(Icons.home_outlined)),               //Tab2
              Tab(text: "Constallations", icon: Icon(Icons.book_outlined)),     //Tab3
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MaterialApp(home: Center(child: Text("Stars")),),
            MaterialApp(home: Center(child: Text("Home")),),
            MaterialApp(home: Center(child: Text("Constallations")),),
          ]),
      )
    );
  }
}