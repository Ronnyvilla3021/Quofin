class HomeState {
  final bool isLoading;
  final String? data;
  final String? error;

  const HomeState({
    this.isLoading = false,
    this.data,
    this.error,
  });

  HomeState copyWith({
    bool? isLoading,
    String? data,
    String? error,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error,
    );
  }
}
