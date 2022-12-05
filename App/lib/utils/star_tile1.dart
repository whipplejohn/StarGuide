// ignore_for_file: import_of_legacy_library_into_null_safe


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_localization/easy_localization.dart';

_launchRadarLink() async {
  var url = Uri.parse("https://www.flightradar24.com/");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

class StarTile1 extends StatelessWidget {
  const StarTile1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 25, right: 25),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 250,
        decoration: BoxDecoration(
            color: Colors.deepOrange[800],
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('lib/images/image2.jpg'),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'step2_card_title'.tr(),
              style: GoogleFonts.bebasNeue(fontSize: 25),
            ),
            Text('step2_card_body'.tr(),
                style: GoogleFonts.bebasNeue(fontSize: 22)),
            ElevatedButton(
              onPressed: _launchRadarLink,
              child: Text("Flight Radar"),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                backgroundColor: Colors.red,
                shadowColor: Colors.white,
                side: BorderSide(color: Colors.white, width: .7),
                padding: EdgeInsets.symmetric(horizontal: 148, vertical: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
