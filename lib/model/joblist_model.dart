import 'dart:convert';

List<JobTypeModel> jobTypeModelFromJson(String str) => List<JobTypeModel>.from(
    json.decode(str).map((x) => JobTypeModel.fromJson(x)));

String jobTypeModelToJson(List<JobTypeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobTypeModel {
  JobTypeModel({
    required this.id,
    required this.date,
    required this.image,
    required this.company,
    required this.location,
    required this.position,
    required this.skillsRequired,
  });

  int id;
  String date;
  String image;
  String company;
  String location;
  String position;
  String skillsRequired;

  factory JobTypeModel.fromJson(Map<String, dynamic> json) => JobTypeModel(
        id: json["id"],
        date: json['date'],
        image: json["image"],
        company: json["company"],
        location: json["location"],
        position: json["position"],
        skillsRequired: json["skills_required"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "image": image,
        "company": company,
        "location": location,
        "position": position,
        "skills_required": skillsRequired,
      };
}

// enum Date { MAR_1620231200_AM }

// final dateValues =
//     EnumValues({"Mar 16, 2023 12:00 AM": Date.MAR_1620231200_AM});

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String>? reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap!;
//   }
// }
