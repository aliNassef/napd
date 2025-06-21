import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:napd/features/nursery/data/repo/nursing_repo.dart';
import 'package:rxdart/rxdart.dart';

import '../../../data/models/hospital_model.dart';

part 'hospital_search_event.dart';
part 'hospital_search_state.dart';

class HospitalSearchBloc
    extends Bloc<HospitalSearchEvent, HospitalSearchState> {
  final NursingRepo nursingRepo;
  HospitalSearchBloc(this.nursingRepo) : super(HospitalSearchInitial()) {
    on<HospitalOnSearchEvent>(
      (event, emit) async {
        if(event.query.isEmpty){
          emit(HospitalSearchEmpty());
          return;
        }
        emit(HospitalSearchLoading());
        final hospitalsOrfailure =
            await nursingRepo.searchOnHospitals(event.query);
        hospitalsOrfailure.fold(
          (failure) => emit(HospitalSearchFailure(failure.errMessage)),
          (hospitals) => emit(HospitalSearchLoaded(hospitals: hospitals)),
        );
      },
      transformer: (events, mapper) =>
          events.debounceTime(const Duration(seconds: 1)).asyncExpand(
                mapper,
              ),
    );
  }
}
