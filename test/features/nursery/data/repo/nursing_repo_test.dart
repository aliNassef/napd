import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:napd/features/nursery/data/models/hospital_model.dart';
import 'package:napd/features/nursery/data/repo/nursing_repo_impl.dart';
import 'package:napd/features/nursery/data/source/nursing_remote_datasource.dart';

class MockNursingRemoteDatasource extends Mock
    implements NursingRemoteDatasource {}

void main() {
  late NursingRemoteDatasource nursingRemoteDatasource;
  late NursingRepoImpl nursingRepoImpl;
  setUp(() {
    nursingRemoteDatasource = MockNursingRemoteDatasource();
    nursingRepoImpl = NursingRepoImpl(
      nursingRemoteDataSource: nursingRemoteDatasource,
    );
  });
  List<HospitalModel> tHospitals = List.generate(
    4,
    (_) {
      return HospitalModel(
        id: 1,
        description: 'desc',
        title: 'title',
        imageUrl: 'imageUrl',
        governorateName: 'governorateName',
        rate: 4,
        isFavourite: true,
        isopended: true,
      );
    },
  );
  test(
    'should return list of hospitals',
    () async {
      when(() => nursingRemoteDatasource.getAllHospitals())
          .thenAnswer((_) async => tHospitals);

      final res = await nursingRepoImpl.getAllHospitals();
      expect(res, equals(right(tHospitals)));
      verify(() => nursingRemoteDatasource.getAllHospitals()).called(1);
    },
  );
}
