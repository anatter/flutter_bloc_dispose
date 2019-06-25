import 'package:meta/meta.dart';

@immutable
abstract class BlocAState {}

class InitialBlocAState extends BlocAState {}

class BlocALoading extends BlocAState {}

class BlocALoaded extends BlocAState {}
