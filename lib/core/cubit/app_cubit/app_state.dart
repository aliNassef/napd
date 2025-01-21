enum States { initial, loading, loaded, error }

extension AppStateExtension on States {
  bool get isInitial => this == States.initial;
  bool get isLoading => this == States.loading;
  bool get isLoaded => this == States.loaded;
  bool get isError => this == States.error;
}

class AppState {
  final States state;
  final String? errorMessage;

  AppState({required this.state, this.errorMessage});

  AppState copyWith({States? state, String? errorMessage}) {
    return AppState(
      state: state ?? this.state,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
