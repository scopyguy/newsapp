import 'package:newsapp/core/resources/data_state.dart';
import 'package:newsapp/core/usecases/usecase.dart';
import 'package:newsapp/features/auth/domain/repository/article_repository.dart';
import 'package:newsapp/features/auth/domain/usecases/entities/article.dart';

class GetSavedArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;
  GetSavedArticleUseCase(this._articleRepository);
  @override
  Future<DataState<List<ArticleEntity>>> call({Params, params}) {
    return _articleRepository.getNewsArticles();
  }
}
