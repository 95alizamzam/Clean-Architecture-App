part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

// * Products
class GetProductsLoadingState extends HomeState {}

class GetProductsDoneState extends HomeState {
  final List<ProductEntity> products;

  const GetProductsDoneState(this.products);
  @override
  List<Object> get props => [products];
}

class GetProductsFailedState extends HomeState {
  final String error;

  const GetProductsFailedState(this.error);
  @override
  List<Object> get props => [error];
}

//* Categories
class GetCategoriesLoadingState extends HomeState {}

class GetCategoriesDoneState extends HomeState {
  final CategoryEntity categories;

  const GetCategoriesDoneState(this.categories);
  @override
  List<Object> get props => [categories];
}

class GetCategoriesFailedState extends HomeState {
  final String error;
  const GetCategoriesFailedState(this.error);
  @override
  List<Object> get props => [error];
}
