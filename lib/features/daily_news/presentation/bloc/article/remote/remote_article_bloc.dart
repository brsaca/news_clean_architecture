import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_clean_architecture/core/resources/data_state.dart';
import 'package:news_clean_architecture/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticlesEvent, RemoteArticlesState> {
  final GetArticeUseCase _getArticeUseCase;

  RemoteArticleBloc(this._getArticeUseCase)
      : super(const RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(GetArticles event, Emitter<RemoteArticlesState> emit) {
    final dataState = await _getArticleUseCase();

    if(dataState is DataSuccess && dataState.data.isNotEmpty) {
      emit (
        RemoteArticlesDone(dataState.data!)
      );
    }

    if(dataState is DataFailed) {
      emit (
        RemoteArticlesError(dataState.error!)
      );
    }
  }
}
