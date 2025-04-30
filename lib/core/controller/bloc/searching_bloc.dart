import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'searching_event.dart';
part 'searching_state.dart';

class SearchingBloc extends Bloc<SearchingEvent, SearchingState> {
  SearchingBloc() : super(SearchingInitial()) {
    on<SearchingEvent>(
      transformer: (events, mapper) {
        return events
            .debounceTime(const Duration(milliseconds: 300))
            .asyncExpand(mapper);
      },
      (event, emit) {
        if (event is SearchingEventSearch) {
          emit(SearchingLoading());
          emit(SearchingLoaded());
        }
      },
    );
  }
}
