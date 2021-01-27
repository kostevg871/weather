import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LastUpdated extends StatelessWidget {
  final DateTime dateTime;

  LastUpdated({Key key, @required this.dateTime})
      : assert(dateTime != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Update: ${TimeOfDay.fromDateTime(dateTime).format(context)}',
      style: GoogleFonts.lato(
        fontSize: 18,
        fontWeight: FontWeight.w300,
        color: Colors.white,
      ),
    );
  }
}
