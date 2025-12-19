import '../../domain/entities/home_entity.dart';
import '../../domain/repositories/home_repository.dart';

class HomeMockRepository implements HomeRepository {
  @override
  Future<HomeEntity> getHomeData() async {
    await Future.delayed(const Duration(seconds: 2));
    return HomeEntity('Datos desde DOMAIN (mock) 🚀');
  }
}
