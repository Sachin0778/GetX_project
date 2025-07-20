import 'package:get/get.dart';
import '../../domain/entities/news_entity.dart';
import '../../domain/usecases/news_usecases.dart';
import '../../data/repositories/news_repository_impl.dart';

class NewsController extends GetxController {
  final GetNewsUseCase _getNewsUseCase = GetNewsUseCase(NewsRepositoryImpl());
  
  final RxList<NewsEntity> news = <NewsEntity>[].obs;
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  Future<void> fetchNews() async {
    try {
      isLoading.value = true;
      error.value = '';
      
      final newsList = await _getNewsUseCase.execute();
      news.value = newsList;
    } catch (e) {
      error.value = 'Failed to load news: $e';
    } finally {
      isLoading.value = false;
    }
  }

  void refreshNews() {
    fetchNews();
  }
} 