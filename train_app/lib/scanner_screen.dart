import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';
import 'dart:async';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScannerScreen extends StatefulWidget {
  ScannerScreen({Key key}) : super(key: key);

  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  String barcode = "";
  String ticket = "";
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final scanButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(5.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          scan();
        },
        child: Text("Scan Ticket",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Ticket Scanner"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Train No: 121',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            Text('Time: 09:00 - 13:00 IST',
                style: TextStyle(fontSize: 20, color: Colors.white70)),
            SizedBox(height: 10),
            new Container(
              height: 3,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            new Image.asset(
              'assets/app_icon.png',
              width: 150.0,
            ),
            SizedBox(height: 50),
            scanButon,
            SizedBox(
              height: 10,
            ),
            new Expanded(
                flex: 1,
                child: SingleChildScrollView(
                    child: new Text(
                  ticket,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ))),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ));
  }

  Future scan() async {
    try {
      print('Running Scan');
      String barcode = await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", true, ScanMode.DEFAULT);
      var parsed = XmlDocument.parse(barcode);
      var uid = parsed.findElements('PrintLetterBarcodeData').single.getAttribute('uid');
      var url = Uri.parse('https://live-ticketing-system.herokuapp.com/trains/121/$uid/occupied/mark');
      var response = await http.get(url);
      print(response.body);
      if (response.body == 'invalid') {
      setState(() => this.ticket = 'Aadhar Card was not linked to a Ticket!');
      } else {
      setState(() => this.ticket = 'Aadhar $uid scanned sucesfully! Seat No: ${response.body}');
      }
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}
