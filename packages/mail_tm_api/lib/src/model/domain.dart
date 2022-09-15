import 'package:json_annotation/json_annotation.dart';
part 'domain.g.dart';

@JsonSerializable()
class Domain {
  Domain(
      {required this.id,
      required this.domain,
      this.isActive = false,
      this.isPrivate = false});

  final String id;
  final String domain;
  final bool isActive;
  final bool isPrivate;

  factory Domain.fromJson(Map<String, dynamic> json) => _$DomainFromJson(json);

  Map<String, dynamic> toJson() => _$DomainToJson(this);

  @override
  String toString() {
    return 'id $id, domain $domain';
  }
}
