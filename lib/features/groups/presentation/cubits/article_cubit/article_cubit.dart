import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:napd/features/groups/data/repo/group_repo.dart';

import '../../../data/model/article_model.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit(this.groupRepo) : super(ArticleInitial());
  final GroupRepo groupRepo;

  void getArticles() async {
    emit(ArticleLoading());
    final result = await groupRepo.getGroups();
    result.fold(
      (failure) => emit(
        ArticleFailure(
          errorMessage: failure.errMessage,
        ),
      ),
      (articles) => emit(ArticleLoaded(articles: articles)),
    );
  }
}
