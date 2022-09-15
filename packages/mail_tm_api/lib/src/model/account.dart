import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'account.g.dart';

@JsonSerializable()
class Account {
  Account({required this.userId, required this.emailId});

  @JsonKey(name: 'id')
  final String userId;
  @JsonKey(name: 'address')
  final String emailId;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);

  @override
  String toString() {
    return 'id $userId, $emailId';
  }
}
