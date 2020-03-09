import 'package:async_redux/async_redux.dart';
import 'package:async_redux_tryout/redux/state/app_state.dart';
import 'package:flutter/material.dart';

import 'ui_action.dart';

class IncrementAction extends ReduxAction<AppState> {
  final int amount;

  IncrementAction({@required this.amount}) : assert(amount != null);

  @override
  Future<void> before() async {
    dispatch(WaitAction(true));
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Future<void> after() async => dispatch(WaitAction(false));

  @override
  Future<AppState> reduce() async {
    final currentValue = state.counterState.value;
    return state.copy(
      counterState: state.counterState.copy(
        value: currentValue + amount,
      ),
    );
  }
}
