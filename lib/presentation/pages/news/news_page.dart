import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/news_controller.dart';
import '../../../domain/entities/news_entity.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsController newsController = Get.find<NewsController>();

    return Scaffold(
      body: Obx(() {
        if (newsController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (newsController.error.value.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  newsController.error.value,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: newsController.refreshNews,
                  child: Text('retry'.tr),
                ),
              ],
            ),
          );
        }

        if (newsController.news.isEmpty) {
          return Center(
            child: Text('no_news'.tr),
          );
        }

        return RefreshIndicator(
          onRefresh: newsController.fetchNews,
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: newsController.news.length,
            itemBuilder: (context, index) {
              final news = newsController.news[index];
              return NewsCard(news: news);
            },
          ),
        );
      }),
    );
  }
}

class NewsCard extends StatelessWidget {
  final NewsEntity news;

  const NewsCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
            child: Image.network(
              news.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image_not_supported, size: 50),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  news.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  news.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${'by'.tr} ${news.author}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[500],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      news.publishedAt,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 