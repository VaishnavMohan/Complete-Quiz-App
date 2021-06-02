import 'dart:convert';

// import 'package:Quiz/pages/user.dart';
import 'package:flutter/material.dart';

// import 'dashboard.dart';
import 'login.dart';
import 'package:http/http.dart' as http;

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class NewUser extends StatefulWidget {
  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  // final _formKey = GlobalKey<FormState>();
  TextEditingController namectrl = TextEditingController();
  TextEditingController emailctrl = TextEditingController();
  TextEditingController pwdctrl = TextEditingController();
  Future save() async {
    var res = await http.post(
      "http://10.0.2.2:3000/api/user/register",
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(
        <String, String>{
          'name': namectrl.text,
          'email': emailctrl.text,
          'password': pwdctrl.text
        },
      ),
    );
    print('Name---${namectrl.text}');
    print('Email--${emailctrl.text}');
    print('Password---${pwdctrl.text}');
    print('RESPONCE!!!!!!!!!!!!!!!!${res.body}');
    var status = jsonDecode(res.body)['Login_status'];
    print('${status}');
    var message = jsonDecode(res.body)['message'];
    if (status == 'fail') {
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      AlertDialog();
    }
  }

  // User user = User('', '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey, Colors.lightBlueAccent]),
        ),
        child: ListView(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 60, left: 10),
                        child: RotatedBox(
                            quarterTurns: -1,
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 38,
                                fontWeight: FontWeight.w900,
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, left: 10.0),
                        child: Container(
                          //color: Colors.green,
                          height: 200,
                          width: 200,
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 60,
                              ),
                              Center(
                                child: Text(
                                  'Register to the world of Quiz',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 50, right: 50),
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        controller: namectrl,
                        // onChanged: (value) {
                        //   user.email = value;
                        // },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Name';
                            // } else if (RegExp(
                            //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            //     .hasMatch(value)) {
                            //   return null;
                          }
                          // else {
                          //   return 'Enter valid email';
                          // }
                        },
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.lightBlueAccent,
                          labelText: 'Name',
                          labelStyle: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 50, right: 50),
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        controller: emailctrl,
                        // onChanged: (value) {
                        //   user.email = value;
                        // },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter something';
                          } else if (RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return null;
                          } else {
                            return 'Enter valid email';
                          }
                        },
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.lightBlueAccent,
                          labelText: 'E-mail',
                          labelStyle: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 50, right: 50),
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        controller: pwdctrl,
                        // onChanged: (value) {
                        //   user.email = value;
                        // },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter something';
                          }
                          return null;
                        },
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 40, right: 50, left: 200),
                    child: Container(
                      alignment: Alignment.bottomRight,
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue[300],
                              blurRadius:
                                  10.0, // has the effect of softening the shadow
                              spreadRadius:
                                  1.0, // has the effect of extending the shadow
                              offset: Offset(
                                5.0, // horizontal, move right 10
                                5.0, // vertical, move down 10
                              ),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: FlatButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            save();
                          } else {
                            print("not ok");
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'OK',
                              style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.lightBlueAccent,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 30),
                    child: Container(
                      alignment: Alignment.topRight,
                      //color: Colors.red,
                      height: 20,
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Have we met before?',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ),
                          FlatButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
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
