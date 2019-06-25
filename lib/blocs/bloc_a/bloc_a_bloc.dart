import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class BlocABloc extends Bloc<BlocAEvent, BlocAState> {
  @override
  BlocAState get initialState => InitialBlocAState();

  @override
  void dispose() {
    print("[BlocABloc] dispose()");
    super.dispose();
  }

  @override
  Stream<BlocAState> mapEventToState(
    BlocAEvent event,
  ) async* {
    switch (event) {
      case BlocAEvent.load:
        yield BlocALoading();
        print("[BlocABloc] BlocAEvent.load");

        /// do something

        yield BlocALoaded();
        break;

      default:
        break;
    }
  }
}
