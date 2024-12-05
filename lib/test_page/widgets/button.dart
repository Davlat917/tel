import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/test_page/widgets/text_wid.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50.h,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
              gradient: const LinearGradient(
                colors: [
                  Color(0xff8183F7),
                  Color(0xffC66EB9),
                ],
              ),
            ),
            child: const Center(
              child: CommonText(
                text: 'Xarid qilish',
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
