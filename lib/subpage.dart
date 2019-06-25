import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/blocs.dart';

class SubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final blocABloc = BlocProvider.of<BlocABloc>(context);
    final blocBBloc = BlocProvider.of<BlocBBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("SubPage"),
      ),
      body: BlocBuilder(
        bloc: blocABloc,
        builder: (context, blocAState) {
          if (blocAState is BlocALoaded) {
            return BlocBuilder(
                bloc: blocBBloc,
                builder: (context, blocBState) {
                  if (blocBState is BlocBLoaded) {
                    return Container(
                        child: Center(
                            child: Text(
                                "BlocA + BlocB loaded; Why does BlocABloc and BlocBBloc call dispose() when going back to home page?")));
                  } else {
                    return Container(child: CircularProgressIndicator());
                  }
                });
          } else {
            return Container(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
