import 'package:flutter/material.dart';
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

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  Widget textSection = const Padding(
    padding: EdgeInsets.all(32),
    child: Text(
      'Welcome to our Laser Star Guide',
      softWrap: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        children: [
          LinearProgressIndicator(),
          textSection,
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
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.network(
                  'https://www.acuitylaser.com/wp-content/uploads/homepage-slider-shutterstock_724314913-1030x688.jpg'),
              Container(
                height: 250.0,
              ),
              const LinearProgressIndicator(),
              const Text(
                '(Connect to "StarGuide" SSID)',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                '⚠️ Prepare for Launch ⚠️ ',
                style: TextStyle(
                  fontSize: 35.0,
                  color: Color.fromARGB(255, 250, 17, 0),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: _launchURLBrowser,
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(5.0)),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(color: Colors.black),
                  ),
                ),
                // textColor: Colors.black,
                // padding: const EdgeInsets.all(5.0),
                child: const Text('Enter Control Room'),
              ),
              const Spacer(),
              const Spacer(),
              const Spacer(),
              const LinearProgressIndicator(),
              const Spacer(),
              Container(
                height: 20.0,
              ),
            ],
          ),
        ),
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
