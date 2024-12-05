import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/test_page/widgets/text_wid.dart';

class PageTopCenter extends StatelessWidget {
  const PageTopCenter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Padding(
        padding: REdgeInsets.only(left: 28, right: 28, top: 22),
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
              child: Image.asset(
                'assets/images/toj.png',
              ),
            ),
            const CommonText(
              text: "Telegram Premium",
              size: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            SizedBox(height: 10.h),
            const CommonText(
              text:
                  "Go beyond the limits and unlock dozens of exclusive features by subscribing to TelegramPremium. Exclusive features by subscribing to TelegramPremium",
              color: Colors.white,
              alignment: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
