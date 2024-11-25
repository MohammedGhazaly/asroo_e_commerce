import 'package:asroo_ecommerce/features/admin/products/data/models/products/products_model/product.dart';
import 'package:asroo_ecommerce/features/admin/products/data/repo/products_repo.dart';
import 'package:asroo_ecommerce/features/admin/products/presentation/cubit/products_state.dart';
import 'package:bloc/bloc.dart';

class ProductsCubit extends Cubit<ProductState> {
  ProductsCubit(this.productsRepo) : super(ProductInitial());
  final ProductsRepo productsRepo;
  List<Product> products = [];
  Future<void> getProducts() async {
    emit(GetProductLoadingState());
    final either = await productsRepo.getProducts();

    either.when(
      success: (model) {
        products = model.data?.products ?? [];
        print("####################");
        print(products);
        print("####################");
        emit(GetProductSuccessState());
      },
      failure: (error) {
        print("FAILURE");
        emit(GetProductFailureState());
      },
    );
  }
}
