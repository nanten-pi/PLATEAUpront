import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mainapp/api.dart';
import 'package:mainapp/dio_provider.dart';
import 'package:mainapp/irepository.dart';
import 'package:mainapp/message_dto.dart';
import 'package:mainapp/repository.dart';

//画面からの指示を振り分けるファイルかな
//mainscreenで読み込まれる
final viewModelProvider =
    StateNotifierProvider<ViewModel, AsyncValue<MessageDTO>>(
        (ref) => ViewModel(Repository(Api(ref.watch(dioProvider)))));

class ViewModel extends StateNotifier<AsyncValue<MessageDTO>> {
  ViewModel(this._repository) : super(const AsyncLoading());
  final IRepository _repository;
  //message_dto.dartのMessageDTOを読み込んでいる
  Future<void> retrieveMessage() async {
    state = const AsyncLoading();
    final MessageDTO message = await _repository.retrieveMessage();
    state = AsyncValue.data(message);
  }
}
