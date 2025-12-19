import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/home_mock_repository.dart';
import '../../domain/repositories/home_repository.dart';
import 'home_state.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  final HomeRepository repository;

  HomeNotifier(this.repository) : super(const HomeState());

  Future<void> loadData() async {
    state = state.copyWith(isLoading: true);

    try {
      final result = await repository.getHomeData();
      state = state.copyWith(
        isLoading: false,
        data: result.message,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Error cargando datos',
      );
    }
  }
}

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeMockRepository();
});

final homeNotifierProvider =
    StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  final repository = ref.read(homeRepositoryProvider);
  return HomeNotifier(repository);
});
