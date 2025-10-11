import 'package:flutter/material.dart';
import 'package:laza_app/core/helpers/spacing.dart';
import 'package:laza_app/core/theme/app_color.dart';
import 'package:laza_app/core/theme/styles.dart';

class HomeProductGrid extends StatelessWidget {
  const HomeProductGrid({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      shrinkWrap: true,

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
        childAspectRatio: 0.62,
      ),
      itemBuilder: (context, index) {
        return const ProductCard();
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 0.95,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.ghostWhite,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Icon(Icons.image, size: 60, color: AppColor.gray),
                ), // Placeholder
              ),
            ),
            verticalSpace(12),
            Text(
              'Nike Sportswear Club Fleece',
              style: AppTextStyles.font11DarkGrayRegular,
              maxLines: 2,
            ),

            Text(
              ' 99',
              style: AppTextStyles.font11DarkGrayRegular.copyWith(height: 1.3),
            ),
          ],
        ),
      ),
    );
  }
}
