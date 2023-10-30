/*Developer: Hugo Isaac Rodríguez Torres
  Name: Money changer.
  For: Curso para principiantes Dart+Flutter mobile apps, Sapiencia Ubicua, UDEA.
  Year: 2023
 */

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CurrencyConverter(),
    );
  }
}

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  double pesos = 0;
  double convertedAmount = 0;
  String selectedCurrency = 'USD';

  Map<String, double> exchangeRates = {
    'USD': 0.00024, // Cambiar a las tasas de conversión reales
    'EUR': 0.00023,
    'GBP': 0.0001997,
  };

  void convertCurrency() {
    setState(() {
      double calcResult = pesos * exchangeRates[selectedCurrency]!;
      convertedAmount = double.parse(calcResult.toStringAsFixed(2));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversor de Monedas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Ingrese la cantidad en pesos'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                pesos = double.tryParse(value) ?? 0;
              },
            ),
            DropdownButton<String>(
              value: selectedCurrency,
              items: exchangeRates.keys.map((String currency) {
                return DropdownMenuItem<String>(
                  value: currency,
                  child: Text(currency),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value!;
                });
              },
            ),
            ElevatedButton(
              onPressed: convertCurrency,
              child: const Text('Convertir'),
            ),
            Text('Resultado: $convertedAmount $selectedCurrency'),
          ],
        ),
      ),
    );
  }
}
