import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app_jobs/bloc/blocs.dart';

class CitySelection extends StatefulWidget {
  @override
  State<CitySelection> createState() => _CitySelectionState();
}

class _CitySelectionState extends State<CitySelection> {
  final TextEditingController _textController = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  controller: _textController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 8.0, right: 8.0),
                    labelText: 'City',
                    hintText: 'Moscow',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                final city = _textController.value.text;
                FocusScope.of(context).requestFocus(_focusNode);
                if (city != null) {
                  BlocProvider.of<WeatherBloc>(context)
                      .add(WeatherRequested(city: city));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
