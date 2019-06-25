import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import './bloc.dart';

import '../blocs.dart';

class BlocCombineBloc extends Bloc<BlocCombineEvent, BlocCombineState> {
  final BlocABloc blocA;
  final BlocBBloc blocB;

  BlocCombineBloc(this.blocA, this.blocB);

  @override
  void dispose() {
    print("[BlocCombineBloc] dispose()");
    super.dispose();
  }

  @override
  BlocCombineState get initialState => InitialBlocCombineState();

  @override
  Stream<BlocCombineState> mapEventToState(
    BlocCombineEvent event,
  ) async* {
    Observable.combineLatest2(blocA.state, blocB.state,
        (BlocAState stateA, BlocBState stateB) {
      if (stateA is BlocALoaded && stateB is BlocBLoaded) {
        /// combine data
      }
    }).listen((data) {
      /// do something with data
    });
  }
}
