import 'package:bloc_test/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'subpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final BlocABloc blocABloc = BlocABloc();
  final BlocBBloc blocBBloc = BlocBBloc();

  @override
  void initState() {
    super.initState();

    blocABloc.dispatch(BlocAEvent.load);
    blocBBloc.dispatch(BlocBEvent.load);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Center(
            child: MaterialButton(
          color: Colors.red,
          child: Text("Go to Sub Page"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<SubPage>(builder: (context) {
                return BlocProviderTree(blocProviders: [
                  BlocProvider<BlocABloc>(
                      builder: (BuildContext context) => blocABloc,
                      dispose: false),
                  BlocProvider<BlocBBloc>(
                      builder: (BuildContext context) => blocBBloc,
                      dispose: false),
                ], child: SubPage());
              }),
            );
          },
        )));
  }
}
