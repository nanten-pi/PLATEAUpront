import 'package:mainapp/message_dto.dart';

//メッセージを送れって言ってるだけのよーわからんクラス
abstract class IRepository {
  Future<MessageDTO> retrieveMessage();
}
