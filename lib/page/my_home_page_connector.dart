import 'package:async_redux/async_redux.dart';
import 'package:async_redux_tryout/redux/state/app_state.dart';
import 'package:flutter/material.dart';

import 'my_home_page.dart';
import 'my_home_page_view_model.dart';

class MyHomePageConnector extends StatelessWidget {
  MyHomePageConnector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MyHomePageViewModel>(
      model: MyHomePageViewModel(),
      builder: (_, vm) {
        return MyHomePage(
          value: vm.value,
          onIncrement: vm.onIncrement,
          username: vm.username,
          isLoading: vm.isLoading,
        );
      },
    );
  }
}
