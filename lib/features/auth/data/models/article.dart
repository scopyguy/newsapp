import 'package:newsapp/features/auth/domain/usecases/entities/article.dart';

class ArticleModels extends ArticleEntity {
  const ArticleModels({
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  });

  factory ArticleModels.fromJson(Map<String, dynamic> map) {
    return ArticleModels(
      author: map['author'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      url: map['url'] ?? "",
      urlToImage: map['urlToImage'] ?? "",
      publishedAt: map['publishedAt'] ?? "",
      content: map['content'] ?? "",
    );
  }
}
