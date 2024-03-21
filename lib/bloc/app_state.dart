part of 'app_bloc.dart';

abstract class AppState {
  List<AssetPathEntity>? paths;
  AppState({this.paths});
}

class AppInitial extends AppState {}

class AppRequestPermissionState extends AppState {}

class AppGetAlbumsState extends AppState {
  List<AssetPathEntity>? paths;
  AppGetAlbumsState({required this.paths}) : super(paths: paths);
}
