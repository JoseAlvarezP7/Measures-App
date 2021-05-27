import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextStyle inputStyle = TextStyle(
    fontSize: 20,
    color: Colors.blue[900],
  );

  final TextStyle labelStyle = TextStyle(
    fontSize: 24,
    color: Colors.grey[700],
  );

  double _numberFrom;

  void initState() {
    _numberFrom = 0;
    // _startMeasure = 'miles';
    super.initState();
  }

  var fruits = ['Orange', 'Apple', 'Strawberry', 'Banana'];

  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'pounces',
  ];
  String _startMeasure;
  String _convertedMeasure;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Measures Converter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Measures Converter'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Spacer(),
              Text(
                'Value',
                style: labelStyle,
              ),
              Spacer(),
              TextField(
                style: inputStyle,
                decoration: InputDecoration(
                  hintText: "Please insert the measure to be converted",
                ),
                onChanged: (text) {
                  var rv = double.tryParse(text);
                  if (rv != null) {
                    setState(() {
                      _numberFrom = rv;
                    });
                  }
                },
              ),
              Spacer(),
              Text(
                'From',
                style: labelStyle,
              ),
              DropdownButton<String>(
                value: _startMeasure,
                items: _measures.map((String _measuresValue) {
                  return DropdownMenuItem(
                    value: _measuresValue,
                    child: Text(
                      _measuresValue,
                      style: inputStyle,
                    ),
                  );
                }).toList(),
                onChanged: (String newValue) {
                  setState(() {
                    _startMeasure = newValue;
                  });
                },
              ),
              Spacer(),
              Text(
                'To',
                style: labelStyle,
              ),
              Spacer(),
              DropdownButton(
                items: _measures.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: inputStyle,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _convertedMeasure = value;
                  });
                },
                value: _convertedMeasure,
              ),
              Spacer(flex: 2),
              ElevatedButton(
                onPressed: () => true,
                child: Text(
                  'Convert',
                  style: inputStyle,
                ),
              ),
              Spacer(),
              Text(
                (_numberFrom == null) ? '' : _numberFrom.toString(),
                style: labelStyle,
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
