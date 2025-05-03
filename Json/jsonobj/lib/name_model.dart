class NamesModel {
  String? name;
  int? age;
  String? profession;
  Details? details;

  NamesModel({this.name, this.age, this.profession, this.details});

  NamesModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    profession = json['profession'];
    details =
        json['details'] != null ? new Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    data['profession'] = this.profession;
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    return data;
  }
}

class Details {
  String? fatherName;

  Details({this.fatherName});

  Details.fromJson(Map<String, dynamic> json) {
    fatherName = json['fatherName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fatherName'] = this.fatherName;
    return data;
  }
}
