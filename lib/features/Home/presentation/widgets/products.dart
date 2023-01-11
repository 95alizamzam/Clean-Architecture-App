import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twekl_test_app/shared/components/error_widget.dart';
import 'package:twekl_test_app/shared/components/sized_box.dart';

import '../../../../shared/components/loader.dart';
import '../../domain/entities/product.dart';
import '../bloc/home_bloc.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => current is GetProductsDoneState,
      builder: (context, state) {
        if (state is GetProductsFailedState) {
          return CustomErrorWidget(
            error: state.error,
            onTap: () {},
          );
        } else if (state is GetProductsDoneState) {
          final List<ProductEntity> products = state.products;
          return SizedBox(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20.h,
              crossAxisSpacing: 20.w,
              childAspectRatio: 2 / 3.8,
              children: products.map((ProductEntity product) {
                return ProductItem(product: product);
              }).toList(),
            ),
          );
        } else {
          return const Loader();
        }
      },
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(
            image: NetworkImage(product.image),
            height: 150.h,
            width: double.maxFinite,
            fit: BoxFit.fill,
          ),
          const Vspace(height: 10),
          Text(
            processTitle(product.title),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 12.sp,
                  color: Colors.black,
                ),
            // maxLines: 1,
            // overflow: TextOverflow.ellipsis,
          ),
          const Vspace(height: 10),
          Text(
            product.description,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 12.sp,
                  color: Colors.black,
                ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Product Details',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.sp,
                ),
              ),
              const Spacer(),
              CircleAvatar(
                radius: 18,
                child: IconButton(
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content: Text('${product.title} Details'),
                        ),
                      );
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String processTitle(String title) {
    if (title.trim().length > 20) {
      return '${title.substring(0, 20)}...';
    }
    return title;
  }
}
