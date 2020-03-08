class AppState {
  final int counter;
  final bool waiting;

  AppState({this.counter, this.waiting});

  AppState copy({int counter, String description, bool waiting}) => AppState(
        counter: counter ?? this.counter,
        waiting: waiting ?? this.waiting,
      );

  static AppState initialState() => AppState(counter: 0, waiting: false);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          counter == other.counter &&
          waiting == other.waiting;

  @override
  int get hashCode => counter.hashCode ^ waiting.hashCode;
}
