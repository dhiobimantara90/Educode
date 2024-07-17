import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/common/theme/app_font_style.dart';
import 'package:quiz/common/utils/transition_fade.dart';
import 'package:quiz/ui/student_quiz_score/widgets/student_quiz_score_content.dart';

class StudentQuizScoreList extends StatelessWidget {
  const StudentQuizScoreList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 59.w,
            width: 60.w,
            decoration: BoxDecoration(
              color: const Color(0XFFBDF565),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(3, 3),
                  blurRadius: 0,
                  spreadRadius: 1,
                )
              ],
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Icon(Icons.arrow_back),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Text(
          "Nilai Kuis siswa",
          style: AppFontStyle.headline4,
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          "Daftar nilai kuis yang dikerjakan siswa",
          style: AppFontStyle.regularLargeText,
        ),
        SizedBox(
          height: 10.h,
        ),
        _listResult(context),
        SizedBox(
          height: 24.h,
        ),
      ],
    );
  }

  Widget _listResult(BuildContext context) {
    // Daftar warna untuk box shadow
    final List<Color> boxShadowColors = [
      Color(0XFFFFC700),
      Color(0XFFC7B9FF),
      Color(0XFFFF8577),
      Color(0XFF00CBB1),
    ];

    return Column(
        children: List.generate(4, (index) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                TransitionFade(child: const StudentQuizScoreContent()),
              );
            },
            child: Container(
                width: 370.w,
                padding: EdgeInsets.only(
                    left: 20.w, right: 20.w, bottom: 15.h, top: 15.h),
                margin: EdgeInsets.symmetric(vertical: 18.h, horizontal: 10.w),
                decoration: BoxDecoration(
                    color: const Color(0XFFF9F5EC),
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: boxShadowColors[index % boxShadowColors.length],
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(5, 5),
                      )
                    ]),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Container(
                        width: double.infinity,
                        height: 150.h,
                        child: Image.asset(
                          "assets/images/Rectangle.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bab 1 Informatika dan Keterampilan Generik",
                          style: AppFontStyle.largeTextBold,
                        ),
                        Text(
                          "Daftar nilai siswa kuis Bab 1",
                          style: AppFontStyle.regularLargeText,
                        )
                      ],
                    ),
                  ],
                )))
      ]);
    }));
  }
}
