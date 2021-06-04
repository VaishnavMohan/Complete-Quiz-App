class Leaders {
  String passScore;
  List<Top> top;

  Leaders({this.passScore, this.top});

  Leaders.fromJson(Map<String, dynamic> json) {
    passScore = json['Pass_Score'];
    if (json['top'] != null) {
      top = new List<Top>();
      json['top'].forEach((v) {
        top.add(new Top.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Pass_Score'] = this.passScore;
    if (this.top != null) {
      data['top'] = this.top.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Top {
  String sId;
  String name;
  int score;
  int iV;

  Top({this.sId, this.name, this.score, this.iV});

  Top.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    score = json['score'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['score'] = this.score;
    data['__v'] = this.iV;
    return data;
  }
}
