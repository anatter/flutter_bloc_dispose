import 'package:meta/meta.dart';

@immutable
abstract class BlocBState {}

class InitialBlocBState extends BlocBState {}

class BlocBLoading extends BlocBState {}

class BlocBLoaded extends BlocBState {}
