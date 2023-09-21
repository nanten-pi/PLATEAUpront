import 'package:mainapp/api.dart';
import 'package:mainapp/irepository.dart';
import 'package:mainapp/message_dto.dart';

class Repository implements IRepository {
  Repository(this._api);
  final Api _api;
//api.dartのretrieveMessageのメソッドを実行している
  @override
  Future<MessageDTO> retrieveMessage() => _api.retrieveMessage();
}
