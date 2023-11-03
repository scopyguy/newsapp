import 'package:newsapp/core/usecases/usecase.dart';
import 'package:newsapp/features/auth/domain/repository/article_repository.dart';
import 'package:newsapp/features/auth/domain/usecases/entities/article.dart';

class RemoveArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;
  RemoveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.savedArticle(params!);
  }
}
