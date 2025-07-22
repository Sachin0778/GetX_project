import '../../../domain/entities/news_entity.dart';
import '../../models/news_model.dart';

class NewsRepositoryImpl {
  Future<List<NewsEntity>> getNews() async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Return dummy news data
    return [
      const NewsModel(
        id: 1,
        title: 'Flutter 3.0 Released with Major Updates',
        description: 'Google has released Flutter 3.0 with significant improvements including better performance, new widgets, and enhanced developer experience.',
        imageUrl: 'https://picsum.photos/300/200?random=1',
        publishedAt: '2024-01-15',
        author: 'John Doe',
      ),
      const NewsModel(
        id: 2,
        title: 'GetX State Management Guide',
        description: 'Learn how to effectively use GetX for state management in Flutter applications with practical examples and best practices.',
        imageUrl: 'https://picsum.photos/300/200?random=2',
        publishedAt: '2024-01-14',
        author: 'Jane Smith',
      ),
      const NewsModel(
        id: 3,
        title: 'Mobile App Development Trends 2024',
        description: 'Discover the latest trends in mobile app development including AI integration, cross-platform solutions, and user experience innovations.',
        imageUrl: 'https://picsum.photos/300/200?random=3',
        publishedAt: '2024-01-13',
        author: 'Mike Johnson',
      ),
      const NewsModel(
        id: 4,
        title: 'Dart Language Updates and Features',
        description: 'Explore the latest features and improvements in the Dart programming language that make Flutter development more efficient.',
        imageUrl: 'https://picsum.photos/300/200?random=4',
        publishedAt: '2024-01-12',
        author: 'Sarah Wilson',
      ),
      const NewsModel(
        id: 5,
        title: 'Building Scalable Flutter Apps',
        description: 'Best practices for building scalable Flutter applications with proper architecture, testing, and deployment strategies.',
        imageUrl: 'https://picsum.photos/300/200?random=5',
        publishedAt: '2024-01-11',
        author: 'David Brown',
      ),
    ];
  }
} 