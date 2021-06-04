import 'dart:convert';

import 'package:Quiz/models/leader.model.dart';
import 'package:Quiz/models/name.model.dart';
import 'package:Quiz/models/questions.model.dart';
import 'package:Quiz/pages/leader.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dashboard.dart';

// String value2;

class Homepg extends StatefulWidget {
  final Name namevalue;
  Homepg({this.namevalue});
  @override
  _HomepgState createState() => _HomepgState();
}

class _HomepgState extends State<Homepg> {
  String value2;
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
    print('Body------${res.body}');
    var status = jsonDecode(res.body)['Pass_Question'];

    var ano = widget.namevalue;
    // return response;
    if (status == 'success')
      Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => Dashboard(
            value: response,
            value2: ano,
          ),
        ),
      );
  }

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

  // pr
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome ${widget.namevalue.name}',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey, Colors.blueGrey]),
        ),
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
                    focusColor: Colors.red,
                    hoverColor: Colors.green,
                    splashColor: Colors.blue,
                    onPressed: () {
                      quiz();
                    },
                    color: Colors.amber,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'Take Quiz',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  FlatButton(
                    color: Colors.amber,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      leaders();
                      // Navigator.push(
                      //   context,
                      //   new MaterialPageRoute(
                      //     builder: (context) => Leader(),
                      //   ),
                      // );
                    },
                    child: Text(
                      'LeaderBoard',
                      style: TextStyle(fontSize: 20),
                    ),
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
