// ignore_for_file: prefer_const_constructors

import 'package:star_guide/utils/star_tile.dart';
import 'package:star_guide/utils/star_tile1.dart';
import 'package:star_guide/utils/star_tile2.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('es', 'MX'),
          Locale('fr', 'FR'),
          Locale('pt', 'BR')
        ],
        path: 'assets/translations',
        fallbackLocale: Locale('en', 'US'),
        child: StarGuide()),
  );
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
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
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
              icon: (const Icon(Icons.wifi)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LaserControl(title: 'Laser Control');
                }));
              },
              tooltip: 'Laser Control'),
          IconButton(
            alignment: Alignment.center,
            icon: (const Icon(Icons.star_outline)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ConstellationInfo(title: 'Constellations');
              }));
            },
          ),
          IconButton(
            alignment: Alignment.center,
            icon: (const Icon(Icons.settings)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Languages(title: 'Languages');
              }));
            },
          ),
        ],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            'home_title'.tr(),
            style: GoogleFonts.bebasNeue(fontSize: 60),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            'home_sub_title'.tr(),
            style: GoogleFonts.bebasNeue(fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 25),
        Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
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
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            'laser_control'.tr(),
            style: GoogleFonts.bebasNeue(fontSize: 45),
            textAlign: TextAlign.center,
          ),
        ),
        Text('laser_control_subheading'.tr(),
            style: GoogleFonts.bebasNeue(fontSize: 15)),
        //const SizedBox(height: 50),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 5, right: 20.0),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  padding: EdgeInsets.all(13),
                  width: 350,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: const [Colors.black, Colors.white]),
                      color: Colors.deepOrange[800],
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('lib/images/image4.jpg'),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                        onPressed: _launchURLBrowser,
                        // ignore: sort_child_properties_last
                        child: Text(
                          'laser_control_button'.tr(),
                          style: bebasNeue,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          backgroundColor: Colors.red,
                          shadowColor: Colors.white,
                          side: BorderSide(color: Colors.white, width: .7),
                          padding: EdgeInsets.symmetric(
                              horizontal: 152, vertical: 25),
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
                'constellation_title'.tr(),
                style: GoogleFonts.bebasNeue(fontSize: 45),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: 450,
            width: double.maxFinite,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Image.asset('lib/images/db1.png', fit: BoxFit.fill),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: 450,
            width: double.maxFinite,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Image.asset('lib/images/db2.png', fit: BoxFit.fill),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: 450,
            width: double.maxFinite,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Image.asset('lib/images/db3.png', fit: BoxFit.fill),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: 450,
            width: double.maxFinite,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Image.asset('lib/images/db4.png', fit: BoxFit.fill),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: 450,
            width: double.maxFinite,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Image.asset('lib/images/db5.png', fit: BoxFit.fill),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: 450,
            width: double.maxFinite,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Image.asset('lib/images/db6.png', fit: BoxFit.fill),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: 450,
            width: double.maxFinite,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Image.asset('lib/images/db8.png', fit: BoxFit.fill),
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

class Languages extends StatelessWidget {
  const Languages({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      'language'.tr(),
                      style: GoogleFonts.bebasNeue(fontSize: 50),
                    ),
                    Text(
                      'language_sub_tittle'.tr(),
                      style: GoogleFonts.bebasNeue(fontSize: 18),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 50),
            ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)))),
              onPressed: () => context.setLocale(Locale('en', 'US')),
              child: Text('language_en_button'.tr()),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)))),
              onPressed: () => context.setLocale(Locale('es', 'MX')),
              child: Text('langugae_sp_button'.tr()),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)))),
              onPressed: () => context.setLocale(Locale('fr', 'FR')),
              child: Text('langugae_fr_button'.tr()),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)))),
              onPressed: () => context.setLocale(Locale('pt', 'BR')),
              child: Text('langugae_ch_button'.tr()),
            ),
          ],
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
