import 'package:async_redux/async_redux.dart';
import 'package:async_redux_tryout/redux/state/app_state.dart';

class WaitAction extends ReduxAction<AppState> {
  final bool isLoading;

  WaitAction(this.isLoading);

  @override
  AppState reduce() {
    return state.copy(
      uiState: state.uiState.copy(
        isLoading: isLoading,
      ),
    );
  }
}
