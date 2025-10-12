import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_app/core/theme/app_color.dart';
import 'package:laza_app/core/theme/styles.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: SizedBox(
            height: 40.h,
            child: TextFormField(
              onTapOutside: (event) => FocusNode().unfocus(),
              decoration: InputDecoration(
                hint: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.search, color: AppColor.gray, size: 20.r),
                    4.horizontalSpace,
                    Text(
                      'Search...',
                      style: AppTextStyles.font17WhiteMedium.copyWith(
                        color: AppColor.gray,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),

                fillColor: AppColor.ghostWhite,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide.none,
                ),
              ),
              cursorHeight: 20.h,
              cursorWidth: 2.w,
            ),
          ),
        ),
        8.horizontalSpace,
        Container(
          height: 40.h,
          width: 50.w,
          decoration: BoxDecoration(
            color: AppColor.mainBlueColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(Icons.mic_none_outlined, color: Colors.white, size: 24.w),
        ),
      ],
    );
  }
}
