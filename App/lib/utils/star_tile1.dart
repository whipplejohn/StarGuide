import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StarTile1 extends StatelessWidget {
  const StarTile1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 25),
      child: Container(
        padding: EdgeInsets.all(12),
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
            Text(
              'Step 2.',
              style: GoogleFonts.bebasNeue(fontSize: 25),
            ),
            Text(
              'Safety is the most important. Please make sure you are in a safe location.\n\nWear Protective eye wear and dont look at lazer derictly!',
            ),
          ],
        ),
      ),
    );
  }
}
