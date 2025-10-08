import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza_app/core/helpers/extensions.dart';
import 'package:laza_app/core/theme/app_color.dart';
import 'package:laza_app/core/widgets/app_svgs.dart';

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({super.key, required this.hasWishlistIcon});

  final bool hasWishlistIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => context.pop(),
          child: Container(
            width: 45.w,
            height: 45.h,

            decoration: ShapeDecoration(
              shape: CircleBorder(),
              color: AppColor.ghostWhite,
            ),
            child: Center(
              child: SvgPicture.asset(
                AppSvgs.appBarArrowLeft,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),

        const Spacer(),
        hasWishlistIcon ? const Icon(Icons.shopping_cart) : SizedBox(),
      ],
    );
  }
}
