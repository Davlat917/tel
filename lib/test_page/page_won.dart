import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_app/test_page/data.dart';
import 'package:test_app/test_page/widgets/button.dart';
import 'package:test_app/test_page/widgets/card.dart';
import 'package:test_app/test_page/widgets/page_top.dart';
import 'package:test_app/test_page/widgets/text_wid.dart';

class CustomScaffold extends StatefulWidget {
  const CustomScaffold({
    super.key,
  });

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext conte6t) {
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
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              PageTopCenter(),
              PageBottomData(),
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
        height: 506.h,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ListView.builder(
                  padding: REdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: getPremiumInfoData.length,
                  itemBuilder: (context, index) {
                    return Cards(
                        ixonPathSvg:
                            getPremiumInfoData.elementAt(index).ixonPathSvg,
                        title: getPremiumInfoData.elementAt(index).title,
                        subtitle: getPremiumInfoData.elementAt(index).subtitle);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NewWidget extends StatefulWidget {
  const NewWidget({
    super.key,
  });

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  int? indexActive;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: REdgeInsets.only(bottom: 10),
            child: const CommonText(
              text: 'Tarifni tanlang',
              fontWeight: FontWeight.w700,
              size: 18,
            ),
          ),
          ...List.generate(
            3,
            (index) {
              return CommonOutlineB(
                onTap: () {
                  indexActive = index;
                  setState(() {});
                },
                title: '${index == 0 ? 3 : index == 1 ? 6 : 12} oylik',
                subtitle:
                    'Obuna muddati amal qilish ${index == 0 ? 3 : index == 1 ? 6 : 12} oy',
                pricesnumber:
                    '${index == 0 ? 45 : index == 1 ? 90 : 150} 000 UZS',
                sideColor: indexActive != null && indexActive == index,
                chegirma: index == 2,
                backgroundColor: indexActive != null && indexActive == index
                    ? const Color.fromRGBO(228, 130, 39, 0.10)
                    : const Color(0xffF0F0F0),
              );
            },
          ),
          const Spacer(),
          Stack(
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
                    onTap: () {},
                    child: const CommonButton(),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

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
