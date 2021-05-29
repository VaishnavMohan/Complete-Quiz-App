// // To parse this JSON data, do
// //
// //     final welcome = welcomeFromJson(jsonString);

// import 'dart:convert';

// Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

// String welcomeToJson(Welcome data) => json.encode(data.toJson());

// class Welcome {
//   Welcome({
//     this.questions,
//   });

//   List<Question> questions;

//   factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
//         questions: List<Question>.from(
//             json["questions"].map((x) => Question.fromJson(x))),
//       );

//   String get answer => null;

//   String get question => null;

//   Map<String, dynamic> toJson() => {
//         "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
//       };
// }

// class Question {
//   Question({
//     this.question,
//     this.answer,
//     this.id,
//   });

//   String question;
//   String answer;
//   int id;

//   factory Question.fromJson(Map<String, dynamic> json) => Question(
//         question: json["question"],
//         answer: json["answer"],
//         id: json["id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "question": question,
//         "answer": answer,
//         "id": id,
//       };
// }
