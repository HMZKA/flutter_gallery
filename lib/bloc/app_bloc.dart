import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:photo_manager/photo_manager.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<AppEvent>((event, emit) {
      requestPermssion(emit);
    });
  }

  requestPermssion(emit) async {
    await PhotoManager.requestPermissionExtend().then((value) {
      if (value == PermissionState.authorized) {
        getAlbums(emit);
      }
      emit(AppRequestPermissionState());
    });
  }

  getAlbums(emit) async {
    emit(AppGetAlbumsState(paths: await PhotoManager.getAssetPathList()));
    print(state.paths?[0].name);
  }
}
