import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'message_dto.dart';

part 'api.g.dart';

@RestApi()
abstract class Api {
  factory Api(Dio dio) = _Api;
  //getのメソッドを実行
  @GET("message")
  //retrieveMessageのメソッドを実行(mainscreenからviewmodelを通して呼び出される)
  Future<MessageDTO> retrieveMessage();
}
