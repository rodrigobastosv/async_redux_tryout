class UiState {
  final bool isLoading;

  UiState({
    this.isLoading,
  });

  UiState copy({bool isLoading}) => UiState(
        isLoading: isLoading ?? this.isLoading,
      );

  static UiState initialState() => UiState(
        isLoading: false,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UiState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading;

  @override
  int get hashCode => isLoading.hashCode;
}
