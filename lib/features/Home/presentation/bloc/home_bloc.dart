import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:twekl_test_app/features/Home/domain/entities/category.dart';
import 'package:twekl_test_app/features/Home/domain/entities/product.dart';
import 'package:twekl_test_app/features/Home/domain/usecases/get_products.dart';

import '../../domain/usecases/get_categories.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetProductsUseCase getProductsUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;

  HomeBloc(
    this.getProductsUseCase,
    this.getCategoriesUseCase,
  ) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetProductsEvent) {
        emit(GetProductsLoadingState());
        final response = await getProductsUseCase();
        response.fold(
          (l) => emit(GetProductsFailedState(l.errorMessage)),
          (r) => emit(GetProductsDoneState(r)),
        );
      } else if (event is GetCategoriesEvent) {
        emit(GetCategoriesLoadingState());
        final response = await getCategoriesUseCase();
        response.fold(
          (l) => emit(GetCategoriesFailedState(l.errorMessage)),
          (r) => emit(GetCategoriesDoneState(r)),
        );
      }
    });
  }
}
