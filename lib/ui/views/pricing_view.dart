import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class PricingView extends StatelessWidget {
  const PricingView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'PricingView',
            style: GoogleFonts.montserratAlternates(
              fontSize: 80,
              fontWeight: FontWeight.bold,
            ),
            ),
        ),
      ),
    );
  }
}