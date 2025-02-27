import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreenContent extends StatelessWidget {
  final String image, heading, subheading;

  const IntroScreenContent({
    required this.image,
    required this.heading,
    required this.subheading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            image,
            height: 250,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(heading,
            style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87)),
        const SizedBox(
          height: 05,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            subheading,
            style: GoogleFonts.poppins(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
