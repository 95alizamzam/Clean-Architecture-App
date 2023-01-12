import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twekl_test_app/core/colors.dart';
import 'package:twekl_test_app/features/Home/presentation/bloc/home_bloc.dart';
import 'package:twekl_test_app/shared/components/sized_box.dart';

import '../../../../shared/components/auto_sized_text.dart';
import '../../../../shared/components/error_widget.dart';
import '../../../../shared/components/loader.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int selectedIndex = -1;

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
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() => selectedIndex = index);
                },
                child: CategoryItem(
                  catLabel: cats[index],
                  bgColor: index == selectedIndex
                      ? primaryColor.withOpacity(.3)
                      : Colors.transparent,
                ),
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
  const CategoryItem({
    super.key,
    required this.catLabel,
    required this.bgColor,
  });
  final String catLabel;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        // color: Colors.transparent,
        color: bgColor,

        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.white),
      ),
      child: Center(
        child: CustomSizedText(
          text: catLabel,
          style: Theme.of(context).textTheme.bodySmall!,
          align: TextAlign.center,
        ),
      ),
    );
  }
}
