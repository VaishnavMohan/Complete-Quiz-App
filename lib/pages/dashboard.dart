import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [Text('Questions')],
            ),
          );
        },
        itemCount: 10,
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
