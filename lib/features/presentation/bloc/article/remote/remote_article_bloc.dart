import 'package:newsapp/core/resources/data_state.dart';
import 'package:newsapp/core/usecases/get_article.dart';
import 'package:newsapp/features/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:newsapp/features/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:bloc/bloc.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticlesUseCase;
  RemoteArticlesBloc(
    this._getArticlesUseCase,
  ) : super(const RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticlesUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      print(dataState.error!.message);
      emit((RemoteArticlesError(dataState.error!, Error)));
    }
  }
}
