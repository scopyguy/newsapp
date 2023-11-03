
import 'package:newsapp/core/usecases/usecase.dart';
import 'package:newsapp/features/auth/domain/repository/article_repository.dart';
import 'package:newsapp/features/auth/domain/usecases/entities/article.dart';

class SavedArticleUseCase
    implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;
  SavedArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity ? params}) {
    return _articleRepository.savedArticle(params!);
  }
}
