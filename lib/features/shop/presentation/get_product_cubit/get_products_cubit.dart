import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/product_model.dart';
import '../../data/repo/shop_repo.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit(this.shopRepo) : super(GetProductsInitial());

  final ShopRepo shopRepo;

  Future<void> getProducts() async {
    emit(GetProductsLoading());
    final result = await shopRepo.getProducts();
    result.fold(
      (failure) => emit(
        GetProductsFailure(failure: failure.errMessage),
      ),
      (products) => emit(
        GetProductsSuccess(products: products),
      ),
    );
  }
}
