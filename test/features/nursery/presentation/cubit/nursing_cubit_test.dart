import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:napd/features/nursery/data/repo/nursing_repo_impl.dart';
import 'package:napd/features/nursery/presentation/manger/nursing_cubit/nursing_cubit.dart';
import 'package:napd/features/nursery/presentation/manger/nursing_cubit/nursing_state.dart';

class MockNursingRepo extends Mock implements NursingRepoImpl {}

void main() {
  late NursingRepoImpl nursingRepo;
  late NursingCubit nursingCubit;

  blocTest<NursingCubit, NursingState>(
    'should emit loading , loaded when getAllHospitals is called success',
    build: () {
      return nursingCubit;
    },
    setUp: () {
      nursingRepo = MockNursingRepo();
      nursingCubit = NursingCubit(nursingRepo);
      when(() => nursingRepo.getAllHospitals()).thenAnswer(
        (_) async => Right([]),
      );
    },
    act: (_) => nursingCubit.getAllHospitals(),
    verify: (_) {
      verify(() => nursingRepo.getAllHospitals()).called(1);
    },
    expect: () => [
      HospitalsLoading(),
      HospitalsLoaded(hospitals: []),
    ],
  );
}
