import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_app/test_page/data.dart';
import 'package:test_app/test_page/widgets/bottom_shet.dart';
import 'package:test_app/test_page/widgets/button.dart';
import 'package:test_app/test_page/widgets/card.dart';
import 'package:test_app/test_page/widgets/page_top.dart';
class CustomScaffold extends StatefulWidget {
  const CustomScaffold({
    super.key,
  });

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff8183F7),
            Color(0xffC66EB9),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              const PageTopCenter(),
              const PageBottomData(),
              Positioned(
                bottom: 20.h, // Tugma pastki chekkasidan bo'sh joy qo'shamiz
                left: 0,
                right: 0,
                child: const MyButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PageBottomData extends StatelessWidget {
  const PageBottomData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffF6F6F6),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.r),
          ),
        ),
        height: 470.h, // Tugmaga joy qoldirish uchun balandlikni kamaytiramiz
        child: SingleChildScrollView(
          child: Padding(
            padding: REdgeInsets.symmetric(
              vertical: 3,
              horizontal: 12,
            ),
            child: Column(
              children: List.generate(getPremiumInfoData.length, (index) {
                return Cards(
                  ixonPathSvg: getPremiumInfoData[index].ixonPathSvg,
                  title: getPremiumInfoData[index].title,
                  subtitle: getPremiumInfoData[index].subtitle,
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 18),
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.center,
            child: CommonButton(),
          ),
          Align(
            alignment: Alignment.center,
            child: Shimmer.fromColors(
              period: const Duration(seconds: 4),
              baseColor: Colors.black.withOpacity(0.1),
              highlightColor: Colors.white54.withOpacity(0.2),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    useRootNavigator: true,
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 428.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: const NewWidget(),
                      );
                    },
                  );
                },
                child: const CommonButton(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}