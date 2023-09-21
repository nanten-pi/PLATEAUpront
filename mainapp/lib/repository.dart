import 'package:mainapp/api.dart';
import 'package:mainapp/irepository.dart';
import 'package:mainapp/message_dto.dart';

class Repository implements IRepository {
  Repository(this._api);
  final Api _api;

  @override
  Future<MessageDTO> retrieveMessage() => _api.retrieveMessage();
}
