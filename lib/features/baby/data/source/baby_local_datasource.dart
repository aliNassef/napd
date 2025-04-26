import 'package:napd/features/baby/data/models/baby_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/functions/get_user.dart';

abstract class BabyLocalDatasource {
  BabyModel getSelectedBaby();
}

class BabyLocalDatasourceImpl implements BabyLocalDatasource {
  @override
  BabyModel getSelectedBaby() {
    try {
      final baby = getBaby();
      return baby!;
    } catch (e) {
      throw CustomException(
        errorMessage: 'Error getting selected baby',
      );
    }
  }
}
