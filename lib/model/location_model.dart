// To parse this JSON data, do
//
//     final locationModel = locationModelFromJson(jsonString);

import 'dart:convert';

List<LocationModel> locationModelFromJson(String str) =>
    List<LocationModel>.from(
        json.decode(str).map((x) => LocationModel.fromJson(x)));

String locationModelToJson(List<LocationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LocationModel {
  LocationModel({
    required this.id,
    required this.place,
  });

  int id;
  String place;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        id: json["id"],
        place: json["place"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "place": place,
      };
}
