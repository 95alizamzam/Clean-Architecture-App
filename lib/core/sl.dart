import 'package:get_it/get_it.dart';
import 'package:twekl_test_app/core/navigation_services.dart';
import 'package:twekl_test_app/core/network.dart';
import 'package:twekl_test_app/core/shared_prefrences.dart';
import 'package:twekl_test_app/features/Auth/data/datasources/remote_ds.dart';
import 'package:twekl_test_app/features/Auth/data/repositories/auth_repo_impl.dart';
import 'package:twekl_test_app/features/Auth/domain/repositories/auth_repo.dart';
import 'package:twekl_test_app/features/Auth/domain/usecases/login_usecase.dart';
import 'package:twekl_test_app/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:twekl_test_app/features/Home/data/datasources/remote_ds.dart';
import 'package:twekl_test_app/features/Home/data/repositories/home_repo_impl.dart';
import 'package:twekl_test_app/features/Home/domain/usecases/get_categories.dart';
import 'package:twekl_test_app/features/Home/presentation/bloc/home_bloc.dart';

import '../features/Home/domain/repositories/home_repo.dart';
import '../features/Home/domain/usecases/get_products.dart';

final sl = GetIt.instance;

void setupSl() {
  sl.registerLazySingleton<DioClass>(() => DioClass());

  sl.registerLazySingleton<NavigationServices>(() => NavigationServices());

  sl.registerLazySingleton<SharedPrefrencesClass>(
      () => SharedPrefrencesClass());

  //* Auth

  sl.registerFactory<AuthBloc>(() => AuthBloc(sl()));
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl());

  sl.registerLazySingleton<BaseAuthRepo>(() => AuthRepoImpl(sl()));

  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));

  //* Home

  sl.registerFactory<HomeBloc>(() => HomeBloc(sl(), sl()));
  sl.registerLazySingleton<BaseHomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl());

  sl.registerLazySingleton<BaseHomeRepository>(() => HomeRepoImpl(sl()));

  sl.registerLazySingleton<GetProductsUseCase>(() => GetProductsUseCase(sl()));

  sl.registerLazySingleton<GetCategoriesUseCase>(
      () => GetCategoriesUseCase(sl()));
}
