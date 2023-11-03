import 'package:equatable/equatable.dart';
import 'package:newsapp/features/auth/domain/usecases/entities/article.dart';

abstract class LocalArticleEvent extends Equatable {
  final ArticleEntity? articles;
  const LocalArticleEvent({this.articles});

  @override
  List<Object> get props => [articles!];
}

class GetSavedArticle extends LocalArticleEvent {
  const GetSavedArticle();
}

class RemoveArticle extends LocalArticleEvent {
  const RemoveArticle(ArticleEntity artticle) : super(articles: artticle);
}

class SavedArticle extends LocalArticleEvent {
  const SavedArticle(ArticleEntity article) : super(articles: article);
}
