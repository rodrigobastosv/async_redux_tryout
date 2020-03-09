import 'package:async_redux_tryout/redux/state/ui_state.dart';

class UiSelector {
  UiSelector(this.uiState);

  final UiState uiState;

  bool isLoading() {
    return uiState.isLoading;
  }
}
