import 'package:newsapp/core/resources/data_state.dart';
import 'package:newsapp/features/auth/domain/usecases/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
