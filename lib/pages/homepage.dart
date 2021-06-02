import 'dart:convert';

import 'package:Quiz/models/name.model.dart';
import 'package:Quiz/models/questions.model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dashboard.dart';

class Homepg extends StatefulWidget {
  final Name namevalue;
  Homepg({this.namevalue});
  @override
  _HomepgState createState() => _HomepgState();
}

class _HomepgState extends State<Homepg> {
  bool isLoading = false;
  Future quiz() async {
    setState(() {
      isLoading = true;
    });
    var res = await http.post(
      "http://10.0.2.2:3000/api/user/answers",
      headers: <String, String>{'Content-Type': 'application/json'},
    );
    setState(() {
      isLoading = false;
    });
    Questionmodel response = Questionmodel.fromJson(jsonDecode(res.body));
    var status = jsonDecode(res.body)['Pass_Question'];
    // return response;
    if (status == 'success')
      Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => Dashboard(
            value: response,
          ),
        ),
      );
  }

  // pr
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome ${widget.namevalue.name}'),
      ),
      body: Container(
        child: Stack(
          children: [
            isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: () {
                      quiz();
                    },
                    child: Text('Take Quiz'),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text('LeaderBoard'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
