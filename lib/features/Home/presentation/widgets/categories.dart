import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twekl_test_app/features/Home/presentation/bloc/home_bloc.dart';
import 'package:twekl_test_app/shared/components/sized_box.dart';

import '../../../../shared/components/error_widget.dart';
import '../../../../shared/components/loader.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => current is GetCategoriesDoneState,
      builder: (context, state) {
        if (state is GetCategoriesDoneState) {
          final List<String> cats = state.categories.categories;
          return SizedBox(
            height: 50,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: cats.length,
              separatorBuilder: (context, index) => const Hspace(width: 10),
              itemBuilder: (context, index) => CategoryItem(
                catLabel: cats[index],
              ),
            ),
          );
        } else if (state is GetCategoriesFailedState) {
          return CustomErrorWidget(
            error: state.error,
            onTap: () {},
          );
        } else {
          return const Loader();
        }
      },
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.catLabel});
  final String catLabel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Center(
        child: Text(
          catLabel,
          style: Theme.of(context).textTheme.bodySmall!,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
