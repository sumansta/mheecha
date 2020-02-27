import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExchangeRate extends StatefulWidget {
  @override
  _ExchangeRateState createState() => _ExchangeRateState();
}

class _ExchangeRateState extends State<ExchangeRate> {
  Future<Rates> futureRates;

  @override
  void initState() {
    super.initState();
    futureRates = fetchExchangeRates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exchange Rates'),
      ),
      body: Center(
        child: FutureBuilder<Rates>(
          future: futureRates,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.rates.toS);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

Future<Rates> fetchExchangeRates() async {
  final response =
      await http.get('https://api.exchangeratesapi.io/latest?base=USD');
  if (response.statusCode == 200) {
    return Rates.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Exchange Rates');
  }
}

class Rates {
  final Map rates;
  final String base;
  final String date;

  Rates({this.rates, this.base, this.date});

  factory Rates.fromJson(Map<String, dynamic> json) {
    return Rates(
      base: json['base'],
      rates: json['rates'],
      date: json['date'],
    );
  }
}
