import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twekl_test_app/core/colors.dart';
import 'package:twekl_test_app/features/Home/presentation/bloc/home_bloc.dart';
import 'package:twekl_test_app/features/Home/presentation/widgets/categories.dart';
import 'package:twekl_test_app/features/Home/presentation/widgets/headline_section.dart';
import 'package:twekl_test_app/features/Home/presentation/widgets/products.dart';
import 'package:twekl_test_app/shared/components/sized_box.dart';

import '../../../../core/sl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()
        ..add(GetProductsEvent())
        ..add(GetCategoriesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
          backgroundColor: primaryColor.withOpacity(.5),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Vspace(height: 20),
              const CustomHeadline(text: 'Categories'),
              const Vspace(height: 16),
              const CategoriesList(),
              const Vspace(height: 20),
              const CustomHeadline(text: 'Products'),
              const Vspace(height: 20),
              Expanded(child: ProductsWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
