import 'package:async_redux/async_redux.dart';
import 'package:async_redux_tryout/redux/state/user_state.dart';
import 'package:flutter/material.dart';

class ChangeEncodingAction extends ReduxAction<UserState> {
  final String encoded;

  ChangeEncodingAction({@required this.encoded}) : assert(encoded != null);

  @override
  UserState reduce() => state.copy(encoded: encoded);
}
