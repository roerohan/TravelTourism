import 'package:flutter/material.dart';

class TrainSelect extends StatefulWidget {
  TrainSelect({Key key}) : super(key: key);

  _TrainSelectState createState() => _TrainSelectState();
}

class _TrainSelectState extends State<TrainSelect> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 10.0);

  @override
  Widget build(BuildContext context) {
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.redAccent,
      child: MaterialButton(
        minWidth: 50,
        padding: EdgeInsets.fromLTRB(5.00, 0, 5.00, 0),
        onPressed: () {
          Navigator.pushNamed(context, '/scan');
        },
        child: Text("Enter Train",
            textAlign: TextAlign.center,
            style: style.copyWith(color: Colors.white, fontSize: 15)),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Ticket Scanner"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('My Trains',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            new Container(
              height: 3,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.black38,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Train Number : 121',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(
                          'Time : 09:00 - 13:00 IST',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: 10),
                        loginButon,
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.black38,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Train Number : 059',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(
                          'Time : 02:00 - 07:00 IST ',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: 10),
                        loginButon,
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.black38,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Train Number : 231',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(
                          'Time : 19:30 - 21:00 IST ',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: 10),
                        loginButon
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
