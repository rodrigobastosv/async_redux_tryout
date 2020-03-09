class UserState {
  final String username;
  final String encoded;

  UserState({
    this.username,
    this.encoded,
  });

  static UserState initialState() => UserState(
        username: 'Teste',
        encoded: 'encoded',
      );

  UserState copy({String username, String encoded}) => UserState(
        username: username ?? this.username,
        encoded: encoded ?? this.encoded,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserState &&
          runtimeType == other.runtimeType &&
          username == other.username &&
          encoded == other.encoded;

  @override
  int get hashCode => username.hashCode ^ encoded.hashCode;
}
