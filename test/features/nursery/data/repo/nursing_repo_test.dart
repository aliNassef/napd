import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:napd/core/errors/error_model.dart';
import 'package:napd/core/errors/exceptions.dart';
import 'package:napd/core/errors/failure.dart';
import 'package:napd/features/nursery/data/models/governorate_model.dart';
import 'package:napd/features/nursery/data/models/hospital_model.dart';
import 'package:napd/features/nursery/data/repo/nursing_repo_impl.dart';
import 'package:napd/features/nursery/data/source/nursing_remote_datasource.dart';

class MockNursingRemoteDatasource extends Mock
    implements NursingRemoteDatasource {}

void main() {
  late MockNursingRemoteDatasource mockRemoteDatasource;
  late NursingRepoImpl nursingRepoImpl;

  // Test data
  final tHospitals = List.generate(
    4,
    (_) => HospitalModel(
      id: 1,
      description: 'desc',
      title: 'title',
      imageUrl: 'imageUrl',
      governorateName: 'governorateName',
      rate: 4,
      isFavourite: true,
      isopended: true,
    ),
  );

  final tGovernorates = List.generate(
    4,
    (_) => GovernorateModel(
      governorateId: 1,
      governorateName: 'name',
    ),
  );

  final tErrorModel = ErrorModel.fromJson({
    'status': false,
    'message': 'error',
  });

  setUp(() {
    mockRemoteDatasource = MockNursingRemoteDatasource();
    nursingRepoImpl =
        NursingRepoImpl(nursingRemoteDataSource: mockRemoteDatasource);
  });

  group('Hospital Tests', () {
    test(
      'should return Right with hospital list when getAllHospitals succeeds',
      () async {
        // Arrange
        when(() => mockRemoteDatasource.getAllHospitals())
            .thenAnswer((_) async => tHospitals);

        // Act
        final result = await nursingRepoImpl.getAllHospitals();

        // Assert
        expect(result, Right(tHospitals));
        verify(() => mockRemoteDatasource.getAllHospitals()).called(1);
        verifyNoMoreInteractions(mockRemoteDatasource);
      },
    );

    test(
      'should return Left with Failure when getAllHospitals throws ServerException',
      () async {
        // Arrange
        when(() => mockRemoteDatasource.getAllHospitals())
            .thenThrow(ServerException(tErrorModel));

        // Act
        final result = await nursingRepoImpl.getAllHospitals();

        // Assert
        expect(
          result,
          Left(Failure(errMessage: tErrorModel.errorMessage)),
        );
        verify(() => mockRemoteDatasource.getAllHospitals()).called(1);
        verifyNoMoreInteractions(mockRemoteDatasource);
      },
    );
  });

  group('Governorate Tests', () {
    test(
      'should return Right with governorate list when getAllGovernorates succeeds',
      () async {
        // Arrange
        when(() => mockRemoteDatasource.getAllGovernorates())
            .thenAnswer((_) async => tGovernorates);

        // Act
        final result = await nursingRepoImpl.getAllGovernorates();

        // Assert
        expect(result, Right(tGovernorates));
        verify(() => mockRemoteDatasource.getAllGovernorates()).called(1);
        verifyNoMoreInteractions(mockRemoteDatasource);
      },
    );

    test(
      'should return Left with Failure when getAllGovernorates throws ServerException',
      () async {
        // Arrange
        when(() => mockRemoteDatasource.getAllGovernorates())
            .thenThrow(ServerException(tErrorModel));

        // Act
        final result = await nursingRepoImpl.getAllGovernorates();

        // Assert
        expect(
          result,
          Left(Failure(errMessage: tErrorModel.errorMessage)),
        );
        verify(() => mockRemoteDatasource.getAllGovernorates()).called(1);
        verifyNoMoreInteractions(mockRemoteDatasource);
      },
    );
  });
}
