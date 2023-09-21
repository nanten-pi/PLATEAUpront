import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_dto.freezed.dart';
part 'message_dto.g.dart';

//取得のすべて説
@freezed
abstract class MessageDTO with _$MessageDTO {
  //結構取得できるjson多いけど、取得するデータごとに分けないと大変なことになりそう
  const factory MessageDTO({
    required String message,
  }) = _MessageDTO;
//自動生成のやつでjsonのクラスは設定されてる???
  factory MessageDTO.fromJson(Map<String, dynamic> json) =>
      _$MessageDTOFromJson(json);
}
