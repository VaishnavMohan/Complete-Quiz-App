import 'dart:convert';
import 'dart:ui';

import 'package:Quiz/models/leader.model.dart';
import 'package:Quiz/models/name.model.dart';
import 'package:Quiz/pages/dashboard.dart';
import 'package:Quiz/pages/leader.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Disp extends StatefulWidget {
  var userscore;
  final Name value2;
  Disp({this.userscore, this.value2});
  @override
  _DispState createState() => _DispState();
}

class _DispState extends State<Disp> {
  Future leaders() async {
    var ress = await http.post(
      "http://10.0.2.2:3000/api/user/leader",
      headers: <String, String>{'Content-Type': 'application/json'},
    );

    Leaders responses = Leaders.fromJson(jsonDecode(ress.body));
    print('Body------${ress.body}');
    var status = jsonDecode(ress.body)['Pass_Score'];

    if (status == 'success')
      Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => Leader(
            high: responses,
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    var valueee = widget.value2;
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blueGrey, Colors.blueGrey]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Hi ${widget.value2.name} Your Score is ${widget.userscore}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlatButton(
                    color: Colors.amber,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      leaders();
                      // score();
                      // Navigator.push(
                      //   context,
                      //   new MaterialPageRoute(
                      //     builder: (context) => Leader(
                      //       // value2: valueee,
                      //       // userscore: userscore,
                      //       high: ,
                      //     ),
                      //   ),
                      // );
                    },
                    child: Text(
                      'ScoreBoard',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
