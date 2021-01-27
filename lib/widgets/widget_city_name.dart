import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CityName extends StatelessWidget {
  final String city;

  CityName({Key key, @required this.city})
      : assert(city != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(city,
        style: GoogleFonts.lato(
          fontSize: 40,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ));
  }
}
