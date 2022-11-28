// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';

class StarTile extends StatelessWidget {
  const StarTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 25),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 250,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 44, 62, 251),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('lib/images/image1.jpg'),
            ),
            Text(
              'step1_card_title'.tr(),
              style: GoogleFonts.bebasNeue(fontSize: 25),
            ),
            Text(
              'step1_card_body'.tr(),
              style: GoogleFonts.bebasNeue(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
