import 'package:floor/floor.dart';
import 'package:newsapp/features/auth/domain/usecases/entities/article.dart';

@Entity(tableName: 'article', primaryKeys: ['id'])
class ArticleModels extends ArticleEntity {
  const ArticleModels({
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
    int? id,
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

  factory ArticleModels.fromEntity(ArticleEntity entity) {
    return ArticleModels(
      id: entity.id,
      author: entity.author,
      title: entity.title,
      description: entity.description,
      url: entity.url,
      urlToImage: entity.urlToImage,
      publishedAt: entity.publishedAt,
      content: entity.content,
    );
  }
}
