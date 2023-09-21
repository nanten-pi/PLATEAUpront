import 'package:mainapp/message_dto.dart';

abstract class IRepository {
  Future<MessageDTO> retrieveMessage();
}
