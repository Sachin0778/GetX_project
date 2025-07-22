import '../entities/news_entity.dart';
import '../../data/repositories/news/news_repository_impl.dart';

class GetNewsUseCase {
  final NewsRepositoryImpl repository;

  GetNewsUseCase(this.repository);

  Future<List<NewsEntity>> execute() async {
    return await repository.getNews();
  }
} 