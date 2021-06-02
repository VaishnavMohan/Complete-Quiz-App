class Questionmodel {
  List<Question> question;

  Questionmodel({this.question});

  Questionmodel.fromJson(Map<String, dynamic> json) {
    if (json['question'] != null) {
      question = new List<Question>();
      json['question'].forEach((v) {
        question.add(new Question.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.question != null) {
      data['question'] = this.question.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Question {
  String sId;
  String question;
  String answer;
  String options001;
  String options002;
  String options003;
  String options004;
  String id;

  Question(
      {this.sId,
      this.question,
      this.answer,
      this.options001,
      this.options002,
      this.options003,
      this.options004,
      this.id});

  Question.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    question = json['question'];
    answer = json['answer'];
    options001 = json['options__001'];
    options002 = json['options__002'];
    options003 = json['options__003'];
    options004 = json['options__004'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['question'] = this.question;
    data['answer'] = this.answer;
    data['options__001'] = this.options001;
    data['options__002'] = this.options002;
    data['options__003'] = this.options003;
    data['options__004'] = this.options004;
    data['id'] = this.id;
    return data;
  }
}
