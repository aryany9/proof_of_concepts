// To parse this JSON data, do
//
//     final feedsModel = feedsModelFromJson(jsonString);

import 'dart:convert';

FeedsModel feedsModelFromJson(String str) =>
    FeedsModel.fromJson(json.decode(str));

String feedsModelToJson(FeedsModel data) => json.encode(data.toJson());

class FeedsModel {
  FeedsModel({
    this.title,
    this.rows,
  });

  String? title;
  List<RowData>? rows;

  factory FeedsModel.fromJson(Map<String, dynamic> json) => FeedsModel(
        title: json["title"],
        rows: json["rows"] == null
            ? null
            : List<RowData>.from(json["rows"].map((x) => RowData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "rows": rows == null
            ? null
            : List<dynamic>.from(rows!.map((x) => x.toJson())),
      };
}

class RowData {
  RowData({
    this.title,
    this.description,
    this.imageHref,
  });

  String? title;
  String? description;
  String? imageHref;

  factory RowData.fromJson(Map<String, dynamic> json) => RowData(
        title: json["title"],
        description: json["description"],
        imageHref: json["imageHref"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "imageHref": imageHref,
      };
}
