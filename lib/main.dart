import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

import 'page/my_home_page_connector.dart';
import 'redux/state/app_state.dart';

Store<AppState> store = Store<AppState>(
  initialState: AppState.initialState(),
);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePageConnector(),
      ),
    );
  }
}
