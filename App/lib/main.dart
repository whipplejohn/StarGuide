// ignore_for_file: prefer_const_constructors

import 'package:star_guide/utils/star_tile.dart';
import 'package:star_guide/utils/star_tile1.dart';
import 'package:star_guide/utils/star_tile2.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const StarGuide());
}

_launchURLBrowser() async {
  var url = Uri.parse("http://192.168.4.1");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

class StarGuide extends StatelessWidget {
  const StarGuide({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Laser Star Guide',
      theme: ThemeData(
        fontFamily: 'GoogleFonts.bebasNeue',
        brightness: Brightness.dark,
        visualDensity: const VisualDensity(horizontal: 2.0, vertical: 2.0),
        primaryColorLight: const Color(0xff03203C),
        primaryColorDark: const Color(0xff242B2E),
      ),
      home: const MyHomePage(
        title: 'Laser Star Guide',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  // ignore: prefer_final_fields
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: (const Icon(Icons.bluetooth_audio_outlined)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LaserControl(title: 'Laser Control');
                }));
              },
              tooltip: 'Laser Control'),
          IconButton(
            alignment: Alignment.center,
            icon: (const Icon(Icons.info_rounded)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ConstellationInfo(title: 'Constellations');
              }));
            },
          ),
        ],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            "The New Way of Star Gazing",
            style: GoogleFonts.bebasNeue(fontSize: 60),
          ),
        ),
        Text(
            'Welcome to our Laser Star Guide, Below are the general guidelines ',
            style: GoogleFonts.bebasNeue(fontSize: 15)),
        const SizedBox(height: 25),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            // ignore: prefer_const_literals_to_create_immutables
            children: [StarTile(), StarTile1(), StarTile2()],
          ),
        ),
      ]),
      bottomNavigationBar: const BottomAppBar(
        child: Text(
          "\nVersion 1.0.0",
          textAlign: TextAlign.center,
        ),
      ),
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
    var bebasNeue = GoogleFonts.bebasNeue(fontSize: 15);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            "⚠️Launch Control⚠️",
            style: GoogleFonts.bebasNeue(fontSize: 50),
          ),
        ),
        Text('Have Fun!', style: GoogleFonts.bebasNeue(fontSize: 15)),
        //const SizedBox(height: 50),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 40.0, bottom: 20),
            child: ListView(
              scrollDirection: Axis.horizontal,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Container(
                  padding: EdgeInsets.all(13),
                  width: 350,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black, Colors.white]),
                      color: Colors.deepOrange[800],
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('lib/images/image6.jpg'),
                      ),
                      const Text("Hello"),
                      ElevatedButton(
                        onPressed: _launchURLBrowser,
                        // ignore: sort_child_properties_last
                        child: Text(
                          'Launch',
                          style: bebasNeue,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          backgroundColor: Colors.red,
                          shadowColor: Colors.white,
                          side: BorderSide(color: Colors.white, width: .7),
                          padding: EdgeInsets.symmetric(
                              horizontal: 132, vertical: 30),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
      bottomNavigationBar: const BottomAppBar(
        child: Text(
          "\nVersion 1.0.0",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

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
      body: ListView(
        children: [
          Row(
            children: [
              SizedBox(width: 10),
              Text(
                "7",
                style: GoogleFonts.bebasNeue(fontSize: 110),
              ),
              SizedBox(width: 40),
              Text(
                "Constellations\n Everyone can find",
                style: GoogleFonts.bebasNeue(fontSize: 45),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: 220,
            width: double.maxFinite,
            child: Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: InkWell(
                splashColor: Color.fromARGB(255, 247, 244, 244).withAlpha(30),
                onTap: () {
                  debugPrint('Card tapped.');
                },
                child: const SizedBox(
                  width: 300,
                  height: 100,
                  child: Text('Here'),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: 220,
            width: double.maxFinite,
            child: Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: InkWell(
                splashColor: Color.fromARGB(255, 255, 255, 255).withAlpha(30),
                onTap: () {
                  debugPrint('Card tapped.');
                },
                child: const SizedBox(
                  width: 300,
                  height: 100,
                  child: Text('Here'),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: 220,
            width: double.maxFinite,
            child: Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: InkWell(
                splashColor: Color.fromARGB(255, 255, 255, 255).withAlpha(30),
                onTap: () {
                  debugPrint('Card tapped.');
                },
                child: const SizedBox(
                  width: 300,
                  height: 100,
                  child: Text('Here'),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: 220,
            width: double.maxFinite,
            child: Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: InkWell(
                splashColor: Color.fromARGB(255, 255, 255, 255).withAlpha(30),
                onTap: () {
                  debugPrint('Card tapped.');
                },
                child: const SizedBox(
                  width: 300,
                  height: 100,
                  child: Text('Here'),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: 220,
            width: double.maxFinite,
            child: Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: InkWell(
                splashColor: Color.fromARGB(255, 255, 255, 255).withAlpha(30),
                onTap: () {
                  debugPrint('Card tapped.');
                },
                child: const SizedBox(
                  width: 300,
                  height: 100,
                  child: Text('Here'),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: 220,
            width: double.maxFinite,
            child: Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: InkWell(
                splashColor: Color.fromARGB(255, 255, 255, 255).withAlpha(30),
                onTap: () {
                  debugPrint('Card tapped.');
                },
                child: const SizedBox(
                  width: 300,
                  height: 100,
                  child: Text('Here'),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: 220,
            width: double.maxFinite,
            child: Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: InkWell(
                splashColor: Color.fromARGB(255, 255, 255, 255).withAlpha(30),
                onTap: () {
                  debugPrint('Card tapped.');
                },
                child: const SizedBox(
                  width: 300,
                  height: 100,
                  child: Text('Here'),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: 220,
            width: double.maxFinite,
            child: Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: InkWell(
                splashColor: Color.fromARGB(255, 255, 255, 255).withAlpha(30),
                onTap: () {
                  debugPrint('Card tapped.');
                },
                child: const SizedBox(
                  width: 300,
                  height: 100,
                  child: Text('Here'),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomAppBar(
        child: Text(
          "\nVersion 1.0.0",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
/* */
