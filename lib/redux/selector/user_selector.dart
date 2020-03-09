import 'package:async_redux_tryout/redux/state/user_state.dart';

class UserSelector {
  UserSelector(this.userState);

  final UserState userState;

  String getUsername() {
    return userState.username;
  }

  String getEncoded() {
    return userState.encoded;
  }
}
