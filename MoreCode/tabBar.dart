import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: IntroPage(),
    theme: ThemeData(
      primarySwatch: Colors.grey,


    )
  ));
}

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey,
            leading: Icon(Icons.star_border_purple500_sharp),
              leadingWidth:100,
            title: Text("Star Guide Demo",style: TextStyle(color: Colors.white),),


            bottom: TabBar(
              tabs: [
                Tab(text: 'Home', icon: Icon(Icons.home_outlined)),
                Tab(text: 'Control', icon: Icon(Icons.bluetooth_audio)),
                Tab(text: 'Constellation', icon: Icon(Icons.info_outline_rounded)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text('This is our Home Page')),
              Center(child: Text('This is Where we control our device')),
              Center(child: Text('This is our database page')),

            ]
          )
        ),
    );
  }
}


// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: const Text('TabBar Widget'),
//       bottom: TabBar(
//         controller: _tabController,
//         tabs: const <Widget>[
//           Tab(
//             icon: Icon(Icons.cloud_outlined),
//           ),
//           Tab(
//             icon: Icon(Icons.beach_access_sharp),
//           ),
//           Tab(
//             icon: Icon(Icons.brightness_5_sharp),
//           ),
//         ],
//       ),
//     ),
//     body: TabBarView(
//       controller: _tabController,
//       children: const <Widget>[
//         Center(
//           child: Text("It's cloudy here"),
//         ),
//         Center(
//           child: Text("It's rainy here"),
//         ),
//         Center(
//           child: Text("It's sunny here"),
//         ),
//       ],
//     ),
//   );
// }
