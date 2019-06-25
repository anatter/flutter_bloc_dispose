import 'package:meta/meta.dart';

@immutable
abstract class BlocCombineState {}

class InitialBlocCombineState extends BlocCombineState {}

class BlocCombineLoading extends BlocCombineState {}

class BlocCombineLoaded extends BlocCombineState {}
