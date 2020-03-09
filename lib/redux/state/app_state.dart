import 'package:async_redux_tryout/redux/state/ui_state.dart';

import 'counter_state.dart';
import 'user_state.dart';

class AppState {
  final UserState userState;
  final CounterState counterState;
  final UiState uiState;

  AppState({
    this.userState,
    this.counterState,
    this.uiState,
  });

  AppState copy({
    UserState userState,
    CounterState counterState,
    UiState uiState,
  }) =>
      AppState(
        userState: userState ?? this.userState,
        counterState: counterState ?? this.counterState,
        uiState: uiState ?? this.uiState,
      );

  static AppState initialState() => AppState(
        userState: UserState.initialState(),
        counterState: CounterState.initialState(),
        uiState: UiState.initialState(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          userState == other.userState &&
          counterState == other.counterState &&
          uiState == other.uiState;

  @override
  int get hashCode {
    return userState.hashCode ^ counterState.hashCode ^ uiState.hashCode;
  }
}
