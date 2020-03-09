class CounterState {
  final int value;

  CounterState({this.value});

  CounterState copy({int value}) => CounterState(
        value: value ?? this.value,
      );

  static CounterState initialState() => CounterState(
        value: 0,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CounterState &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}
