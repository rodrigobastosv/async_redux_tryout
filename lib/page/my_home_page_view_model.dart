import 'package:async_redux/async_redux.dart';
import 'package:async_redux_tryout/redux/action/counter_action.dart';
import 'package:async_redux_tryout/redux/state/app_state.dart';
import 'package:flutter/material.dart';

class MyHomePageViewModel extends BaseModel<AppState> {
  MyHomePageViewModel();

  int value;
  bool isLoading;
  String username;
  VoidCallback onIncrement;

  MyHomePageViewModel.build({
    @required this.value,
    @required this.isLoading,
    @required this.username,
    @required this.onIncrement,
  }) : super(equals: [value, isLoading]);

  @override
  MyHomePageViewModel fromStore() {
    return MyHomePageViewModel.build(
      value: state.counterState.value,
      isLoading: state.uiState.isLoading,
      username: state.userState.username,
      onIncrement: () => store.dispatch(IncrementAction(amount: 1)),
    );
  }
}
