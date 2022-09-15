import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'news.g.dart';

@JsonSerializable()
class News {
  News(
      {required this.title,
      required this.description,
      this.image,
      this.url,
      this.publishedDate})
      : assert(title.isNotEmpty && description.isEmpty,
            'title and description can not be empty');
  final String title;
  final String description;
  final String? url;
  final String? image;
  @JsonKey(name: 'published_at')
  final String? publishedDate;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);

  @override
  String toString() {
    return 'title $title, description $description';
  }
}
