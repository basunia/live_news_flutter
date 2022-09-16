import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  Account({required this.userId, required this.emailId, required this.token});

  final String userId;
  final String emailId;
  final String token;

  @JsonKey(ignore: true)
  Map<String, String> get headers => {'Authorization': 'Bearer $token'};

  Map<String, dynamic> toJson() => _$AccountToJson(this);

  factory Account.fromJson(json) => _$AccountFromJson(json);

  @override
  String toString() {
    return 'id $userId, $emailId';
  }
}
