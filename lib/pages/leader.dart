import 'dart:convert';

import 'package:Quiz/models/leader.model.dart';
import 'package:Quiz/pages/homepage.dart';
import 'package:Quiz/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dashboard.dart';

class Leader extends StatefulWidget {
  final Leaders high;
  Leader({this.high});

  // int userscore;
  // final Name value2;
  // Leader({this.userscore, this.value2});
  @override
  _LeaderState createState() => _LeaderState();

  static Leader fromJson(jsonDecode) {}
}

class _LeaderState extends State<Leader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SCOREBOARD',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: widget.high.top.length,
        itemBuilder: (context, int index) {
          String leaders = widget.high.top[index].name;
          var scores = widget.high.top[index].score;
          var ind = index;
          return LeaderUI(
            leader: leaders,
            score: scores,
            index: ind,
          );
          // print('insidelistview---------${index}');
        },
      ),
    );
  }
}

class LeaderUI extends StatefulWidget {
  const LeaderUI({
    this.leader,
    this.score,
    this.index,
  });
  final String leader;
  final int score;
  final int index;

  @override
  _LeaderUIState createState() => _LeaderUIState();
}

class _LeaderUIState extends State<LeaderUI> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        SizedBox(
          height: 40,
        ),
        Container(
          child: Text('${widget.index + 1}'),
        ),
        SizedBox(
          width: 30,
        ),
        Container(
          child: Text(widget.leader),
        ),
        SizedBox(
          width: 30,
        ),
        Container(
          child: Text('${widget.score}'),
        ),
      ],
    ));
  }
}
