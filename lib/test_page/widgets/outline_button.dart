

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/test_page/widgets/text_wid.dart';

class CommonOutlineB extends StatelessWidget {
  final String title;
  final String subtitle;
  final String pricesnumber;
  final bool sideColor;
  final Color? backgroundColor;
  final bool chegirma;
  final void Function()? onTap;
  const CommonOutlineB(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.pricesnumber,
      required this.sideColor,
      this.backgroundColor,
      this.onTap,
      this.chegirma = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 10),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          side: (!sideColor)
              ? BorderSide.none
              : const BorderSide(
                  width: 2,
                  color: Color(0xffE48227),
                ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
        ),
        onPressed: onTap,
        child: ListTile(
          contentPadding: const EdgeInsets.all(0),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: title,
                size: 16,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                width: 10.h,
              ),
              chegirma
                  ? SizedBox(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.r)),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff8183F7),
                              Color(0xffC66EB9),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: REdgeInsets.all(4),
                            child: const CommonText(
                              text: '-50 000 UZS',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          subtitle: CommonText(
            text: subtitle,
            size: 12,
            fontWeight: FontWeight.w500,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonText(
                text: pricesnumber,
                color: const Color(
                  0xffE48227,
                ),
              ),
              chegirma
                  ? const CommonText(
                      decoration: TextDecoration.lineThrough,
                      text: "200 000 UZS",
                      color: Color(
                        0xff6E7275,
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
