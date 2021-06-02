import 'dart:convert';

import 'package:Quiz/models/questions.model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Dashboard extends StatefulWidget {
  // Dashboard({Key key}) : super(key: key);

  final Questionmodel value;
  Dashboard({this.value});

  @override
  _DashboardState createState() => _DashboardState();
}

String a1;
String a2;
var lead = List(10);
int out = 0;

class _DashboardState extends State<Dashboard> {
  
  // Future save() async {
  // var res = await http.post(
  // "http://10.0.2.2:3000/api/user/answers",
  // headers: <String, String>{'Content-Type': 'application/json'},
  // );
  // print('${res.body}');
  // Questionmodel response = Questionmodel.fromJson(jsonDecode(res.body));

  // response.question.forEach((element) {
  //   print(element);
  // });

  // print('${response.question.length}');
  // return response;
  // response.question.forEach((element) {
  //   print(element.question);
  //   print(element.answer);
  // });

  // Map Quest = {
  //   "question": "India is my Country",
  //   "answer": {
  //     'inside': 'value',
  //     'inside2': 'value',
  //     'inside3': [
  //       '1',
  //       '2',
  //       '3',
  //     ],
  //   },
  //   "options1": "111",
  //   "options2": "222",
  //   "options3": "333",
  //   "options4": "Yes",
  //   "id": 4
  // };
  // print('${Quest['question']}');
  // print('${Quest['answer']}');
  // print('${Quest['options1']}');
  // var hi = Quest['answer'];
  // print('${hi['inside2']}');
  // print('${hi['inside3']}');
  // var arrayy = hi['inside3'];
  // print(arrayy[1]);
  // print('${res.body}');
  // List status = jsonDecode(res.body)['question'];
  // status.forEach((element) {
  //   print('${element['question']}');
  // });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: widget.value.question.length,
          itemBuilder: (context, index) {
            // widget.value;
            void stuck() {
              lead[index];
            }

            String quest = widget.value.question[index].question;
            String op1 = widget.value.question[index].options001;
            String op2 = widget.value.question[index].options002;
            String op3 = widget.value.question[index].options003;
            String op4 = widget.value.question[index].options004;
            String ans = widget.value.question[index].answer;

            // widget.value.question.forEach((element) {
            //   op3 = element.options003;
            // });
            // body: ListView.builder(
            //   itemCount: 2,
            //   itemBuilder: (context, index) {
            //     return QuestionUI(
            //       question: 'India is my country',
            //       option1: '1',
            //       option2: '2',
            //       option3: '4',
            //       option4: 'yes',
            //     );
            //   },
            // ),
            return QuestionUI(
              question: quest,
              option1: op1,
              option2: op2,
              option3: op3,
              option4: op4,
              answer: ans,
            );
          },
        ),
        bottomNavigationBar: BottomAppBar(
          child: FlatButton(
            onPressed: () {
              if (lead == 1) {}
              print(out);
            },
            child: Text('Submit'),
          ),
        ));
  }
}

class QuestionUI extends StatefulWidget {
  const QuestionUI({
    this.question,
    this.option1,
    this.option2,
    this.option3,
    this.option4,
    this.answer,
  });
  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final String answer;
  @override
  _QuestionUIState createState() => _QuestionUIState();
}

class _QuestionUIState extends State<QuestionUI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blueGrey, Colors.lightBlueAccent]),
      ),
      child: Theme(
        data: ThemeData.dark(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.question),
            RadioListTile<String>(
              title: Text(widget.option1),
              value: 'op1',
              groupValue: a1,
              onChanged: (value) {
                setState(() {
                  a1 = value;
                });
                if (widget.option1 == widget.answer) {
                  lead[0] = 1;
                } 
              },
            ),
            RadioListTile<String>(
              title: Text(widget.option2),
              value: 'op2',
              groupValue: a1,
              onChanged: (String value) {
                setState(() {
                  a1 = value;
                });
                if (widget.option2 == widget.answer) {
                  lead[0] = 1;
                } else {
                  lead[0] = 0;
                }
              },
            ),
            RadioListTile<String>(
              title: Text(widget.option3),
              value: 'op3',
              groupValue: a1,
              onChanged: (String value) {
                setState(() {
                  a1 = value;
                });
                if (widget.option3 == widget.answer) {
                  lead[0] = 1;
                } else {
                  lead[0] = 0;
                }
              },
            ),
            RadioListTile<String>(
              title: Text(widget.option4),
              value: 'op4',
              groupValue: a1,
              onChanged: (String value) {
                setState(() {
                  a1 = value;
                });
                if (widget.option4 == widget.answer) {
                  lead[0] = 1;
                } else {
                  lead[0] = 0;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
// Scaffold(
//       body: Center(
//         child: Text("Quiz",
//             style: TextStyle(
//                 fontWeight: FontWeight.bold, fontSize: 50, color: Colors.blue)),
//       ),
//     );

// Center(
//   child: FlatButton(
//     onPressed: () {
//       save();
//     },
//     child: Text('Press'),
//   ),
// ),
