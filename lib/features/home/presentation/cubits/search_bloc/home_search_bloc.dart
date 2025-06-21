import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../data/model/search_model.dart';
import '../../../data/repo/home_repo.dart';

part 'home_search_event.dart';
part 'home_search_state.dart';

class HomeSearchBloc extends Bloc<HomeSearchEvent, HomeSearchState> {
  final HomeRepo homeRepo;
  HomeSearchBloc(this.homeRepo) : super(HomeSearchInitial()) {
    on<HomeOnSearchEvent>(
      (event, emit) async {
        emit(HomeSearchLoading());
        final result = await homeRepo.search(event.query);
        result.fold(
          (failure) => emit(HomeSearchFailure(errMessage: failure.errMessage)),
          (searchModel) => emit(HomeSearchLoaded(searchModel: searchModel)),
        );
      },
      transformer: (events, mapper) => events
          // ignore: unnecessary_type_check
          .where((event) => event is HomeOnSearchEvent)
          .debounceTime(
            const Duration(milliseconds: 300),
          )
          .asyncExpand(mapper),
    );
  }
}
