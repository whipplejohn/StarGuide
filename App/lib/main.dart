import 'package:flutter/material.dart';


void main() {
  runApp(const StarGuide());
}

class StarGuide extends StatelessWidget {
  const StarGuide({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laser Star Guide',
      theme: ThemeData(
          brightness: Brightness.dark,
          visualDensity: const VisualDensity(horizontal: 2.0, vertical: 2.0),
          primaryColorLight: const Color(0xff03203C),
          primaryColorDark: const Color(0xff242B2E),
      ),

      home: const MyHomePage(title: 'Laser Star Guide'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {

    //final ButtonStyle style = TextButton.styleFrom(
    //    foregroundColor: Theme.of(context).colorScheme.onPrimary,
    //);


    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: <Widget>[

          IconButton(

            icon: (const Icon(Icons.bluetooth_audio_outlined)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const LaserControl(title: 'Laser Control');
              }));
                },
            tooltip: 'Laser Control'
              ),

          IconButton(
            alignment: Alignment.center,
            icon: (const Icon(Icons.info_outline_sharp)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ConstellationInfo(title: 'Constellations');
              }));
            },
          ),


        ],
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//This is the class for The Laser Device Control page
class LaserControl extends StatefulWidget {
  const LaserControl({super.key, required this.title});

  final String title;

  @override
  State<LaserControl> createState() => LaserControlState();
}



//This is the class for The Laser Device Control page
class LaserControlState extends State<LaserControl> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}
//test

//This is the class for The Constellation Information page
class ConstellationInfo extends StatelessWidget {
  const ConstellationInfo({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}
/* */
