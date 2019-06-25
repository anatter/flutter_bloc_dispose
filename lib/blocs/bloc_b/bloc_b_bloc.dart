import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class BlocBBloc extends Bloc<BlocBEvent, BlocBState> {
  @override
  BlocBState get initialState => InitialBlocBState();

  @override
  void dispose() {
    print("[BlocBBloc] dispose()");
    super.dispose();
  }

  @override
  Stream<BlocBState> mapEventToState(
    BlocBEvent event,
  ) async* {
    switch (event) {
      case BlocBEvent.load:
        yield BlocBLoading();
        print("[BlocBBloc] BlocBEvent.load");

        /// do something

        yield BlocBLoaded();
        break;

      default:
        break;
    }
  }
}
