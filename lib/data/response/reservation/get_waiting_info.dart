import 'package:json_annotation/json_annotation.dart';
part 'get_waiting_info.g.dart';

@JsonSerializable()
class GetWaitingInfoResponse {
  @JsonKey(name: "reservationNumber")
  final int reservationNumber;
  @JsonKey(name: "position")
  final int position;
  @JsonKey(name: "time")
  final int time;

  GetWaitingInfoResponse({
    required this.reservationNumber,
    required this.position,
    required this.time,
  });

  factory GetWaitingInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetWaitingInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetWaitingInfoResponseToJson(this);
}
