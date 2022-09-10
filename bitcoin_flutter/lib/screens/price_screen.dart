import 'dart:io' show Platform;

import 'package:bitcoin_flutter/models/rate.dart';
import 'package:bitcoin_flutter/services/ticker_service.dart';
import 'package:bitcoin_flutter/test.dart';
import 'package:bitcoin_flutter/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  final TickerService tickerService = TickerService();

  String selectedFiat = currenciesList.first;
  Rate? btcRate;
  Rate? ethRate;
  Rate? ltcRate;

  Future<void> _getRatesForFiat(String fiat) async {
    try {
      final futures = [
        tickerService.getCryptFiatRate(crypto: "BTC", fiat: fiat),
        tickerService.getCryptFiatRate(crypto: "ETH", fiat: fiat),
        tickerService.getCryptFiatRate(crypto: "LTC", fiat: fiat),
      ];

      final resolvedData = await Future.wait(futures);

      setState(() {
        btcRate = resolvedData[0];
        ethRate = resolvedData[1];
        ltcRate = resolvedData[2];
      });
    } catch (e) {
      print("there was an error: $e");
    }
  }

  @override
  void initState() {
    _getRatesForFiat(selectedFiat);
  }

  @override
  Widget build(BuildContext context) {
    tester();
    return Scaffold(
      appBar: AppBar(
        title: Text("Ticket🤷‍"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
            child: _renderCryptoToFiatCard(
                crypto: cryptoList[0], fiat: selectedFiat, rate: btcRate?.rate),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
            child: _renderCryptoToFiatCard(
                crypto: cryptoList[1], fiat: selectedFiat, rate: ethRate?.rate),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
            child: _renderCryptoToFiatCard(
                crypto: cryptoList[2], fiat: selectedFiat, rate: ltcRate?.rate),
          ),
          Expanded(
            child: Container(
                // child: TextButton(
                //   child: Text("Just test"),
                //   onPressed: () async {
                //     // final Rate data = await tickerService.getCryptFiatRate(
                //     //     crypto: cryptoList.first, fiat: currenciesList.first);
                //
                //     await _getRatesForFiat(currenciesList.first);
                //   },
                // ),
                ),
          ),
          Container(
            height: 150,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30),
            color: Colors.lightBlue,
            child: _renderCryptoPicker(),
          )
        ],
      ),
    );
  }

  Card _renderCryptoToFiatCard({
    required String crypto,
    required String fiat,
    double? rate,
  }) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 28),
        child: rate != null
            ? Text(
                "1 $crypto = ${rate.toString()} $fiat",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              )
            : CircularProgressIndicator(),
      ),
    );
  }

  Widget _renderCryptoPicker() {
    if (Platform.isIOS) return _renderCupertinoCryptoPicker();
    return _renderMaterialCryptoPicker();
  }

  Widget _renderCupertinoCryptoPicker() {
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32,
      onSelectedItemChanged: (index) {
        setState(() {
          selectedFiat = cryptoList[index];
          _getRatesForFiat(selectedFiat);
        });
      },
      children: currenciesList.map<Text>(
        (c) {
          return Text(c);
        },
      ).toList(),
    );
  }

  Widget _renderMaterialCryptoPicker() {
    return DropdownButton<String>(
      value: selectedFiat,
      onChanged: (value) {
        if (value == null) return;

        selectedFiat = value;
        _getRatesForFiat(value);
      },
      items: currenciesList.map<DropdownMenuItem<String>>((c) {
        return DropdownMenuItem<String>(
          value: c,
          child: Text(c),
        );
      }).toList(),
    );
  }
}
