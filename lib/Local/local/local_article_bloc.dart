import 'package:bloc/bloc.dart';
import 'package:newsapp/Local/local/local_article_event.dart';
import 'package:newsapp/Local/local/local_article_state.dart';
import 'package:newsapp/features/auth/domain/usecases/entities/article.dart';
import 'package:newsapp/features/auth/domain/usecases/get_saved_article.dart';
import 'package:newsapp/features/auth/domain/usecases/remove_article.dart';
import 'package:newsapp/features/auth/domain/usecases/save_article.dart';

class LocalArticlesBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SavedArticleUseCase _savedArticleUseCase;

  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticlesBloc(
    this._getSavedArticleUseCase,
    this._savedArticleUseCase,
    this._removeArticleUseCase,
  ) : super(const LocalArticlesLoading()) {
    on<GetSavedArticle>(onGetSavedArticle);
    on<RemoveArticle>(onRemoveArticle);
    on<SavedArticle>(onSaveArticle);
  }

  void onGetSavedArticle(
      GetSavedArticle event, Emitter<LocalArticleState> emit) async {
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles as List<ArticleEntity>));
  }

  void onRemoveArticle(
      RemoveArticle removeArticle, Emitter<LocalArticleState> emit) async {
    await _removeArticleUseCase();
    final articles =
        await _getSavedArticleUseCase(params: removeArticle.articles);
    emit(LocalArticlesDone(articles as List<ArticleEntity>));
  }

  void onSaveArticle(
      SavedArticle savedArticle, Emitter<LocalArticleState> emit) async {
    await _savedArticleUseCase();
    final articles =
        await _getSavedArticleUseCase(params: savedArticle.articles);
    emit(LocalArticlesDone(articles as List<ArticleEntity>));
  }
}
