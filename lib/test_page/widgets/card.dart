import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app/test_page/widgets/text_wid.dart';

class Cards extends StatelessWidget {
  final String ixonPathSvg;
  final String title;
  final String subtitle;
  const Cards({
    super.key,
    this.ixonPathSvg = "assets/icons/hamyon.svg",
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(14.r),
              ),
              color: const Color(0xffffffff)),
          child: Padding(
            padding: REdgeInsets.all(14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.11,
                  child: SizedBox(
                    width: 42.w,
                    height: 42.h,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: Color(0xffE48227),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: REdgeInsets.all(11),
                        child: SvgPicture.asset(
                          ixonPathSvg,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 18.w,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.64,
                  child: Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: title,
                          color: Colors.black,
                        ),
                        CommonText(
                          text: subtitle,
                          color: const Color(0xff5A5A5A),
                          size: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
