import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:napd/features/groups/data/repo/group_repo.dart';
import 'package:rxdart/rxdart.dart';

import '../../../data/model/article_model.dart';

part 'article_search_event.dart';
part 'article_search_state.dart';

class ArticleSearchBloc extends Bloc<ArticleSearchEvent, ArticleSearchState> {
  final GroupRepo groupRepo;
  ArticleSearchBloc(this.groupRepo) : super(ArticleSearchInitial()) {
    on<ArticleOnSearchEvent>(
      (event, emit) async {
        emit(ArticleSearchLoading());
        final result = await groupRepo.searchArticles(event.query);
        result.fold(
          (failure) =>
              emit(ArticleSearchFailure(errMessage: failure.errMessage)),
          (articles) => emit(ArticleSearchLoaded(articles: articles)),
        );  
      },
      transformer: (events, mapper) {
        return events
            .where((event) => event is ArticleOnSearchEvent)
            .debounceTime(const Duration(milliseconds: 300))
            .asyncExpand(mapper);
      },
    );
  }
}
