import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twekl_test_app/shared/components/auto_sized_text.dart';
import 'package:twekl_test_app/shared/components/error_widget.dart';

import '../../../../shared/components/loader.dart';
import '../../../../shared/components/sized_box.dart';
import '../../domain/entities/product.dart';
import '../bloc/home_bloc.dart';

class ProductsWidget extends StatelessWidget {
  ProductsWidget({super.key});

  bool isAndroid = defaultTargetPlatform == TargetPlatform.android;
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
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 300.h, //* insted of aspectRatio
              mainAxisSpacing: 10.h,
              crossAxisSpacing: 10.w,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) =>
                ProductItem(product: products[index]),
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
          Expanded(
            flex: 6,
            child: Image(
              image: NetworkImage(product.image),
              // height: 150.h,
              width: double.maxFinite,
              fit: BoxFit.fill,
            ),
          ),
          const Vspace(height: 10),
          CustomSizedText(
            text: product.title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 12.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const Vspace(height: 4),
          CustomSizedText(
            text: product.description,
            maxLine: 3,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 12.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
          ),
          const Vspace(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomSizedText(
                text: 'Product Details',
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
}
