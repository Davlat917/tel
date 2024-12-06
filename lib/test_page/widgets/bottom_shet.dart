
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_app/test_page/widgets/button.dart';
import 'package:test_app/test_page/widgets/outline_button.dart';
import 'package:test_app/test_page/widgets/text_wid.dart';

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
