import 'package:flutter/material.dart';

class CityName extends StatelessWidget {
  final String city;

  CityName({Key key, @required this.city})
      : assert(city != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      city,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
