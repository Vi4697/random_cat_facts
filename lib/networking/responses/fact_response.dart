import 'package:json_annotation/json_annotation.dart';

part 'fact_response.g.dart';

@JsonSerializable(createToJson: false)
class RandFactResponse {
  @JsonKey(name: 'fact')
  final String fact;

  const RandFactResponse(this.fact);

  factory RandFactResponse.fromJson(Map<String, dynamic> json) =>
      _$RandFactResponseFromJson(json);
}
