import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/theme/app_color.dart';
import '../constants/theme/app_theme.dart';

typedef DialogOptionBuilder<T> = Map<String, T?> Function();

Future<T?> showGenericDialog<T>({
  required BuildContext context,
  required String title,
  String? content,
  required Color dialogColor,
  Widget? icon,
  required DialogOptionBuilder optionsBuilder,
  required String selectedOption,
}) {
  final options = optionsBuilder();

  return showDialog<T>(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 40.h),
          backgroundColor: AppColors.whiteColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: SizedBox(
            width: double.maxFinite,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 15.h),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: icon,
                    ),
                    SizedBox(height: 25.h),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: AppTextTheme.PR_SANS20W700CBlack,
                    ),
                    (content != null)
                        ? Column(
                            children: [
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                content,
                                style: AppTextTheme.PR_SANS14W400CBlack60,
                              )
                            ],
                          )
                        : const SizedBox.shrink(),
                    SizedBox(height: 25.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ...(options.keys).map((optionTitle) {
                            final value = options[optionTitle];
                            return SizedBox(
                              height: 0.06.sh,
                              width: 0.45.sw,
                              child: TextButton(
                                style: ButtonStyle(
                                  textStyle: MaterialStateProperty.resolveWith(
                                      (states) {
                                    return AppTextTheme.PR_SANS20W700CWhite;
                                  }),
                                  overlayColor:
                                      MaterialStateProperty.all<Color>(
                                    (optionTitle == selectedOption)
                                        ? dialogColor
                                        : Colors.grey.withOpacity(0.1),
                                  ),
                                  foregroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) => (optionTitle ==
                                                  selectedOption)
                                              ? Colors.white
                                              : Colors.grey.withOpacity(0.5)),
                                  backgroundColor:
                                      MaterialStateColor.resolveWith((states) {
                                    return (optionTitle == selectedOption)
                                        ? dialogColor
                                        : Colors.grey.withOpacity(0.1);
                                  }),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0))),
                                ),
                                onPressed: () {
                                  if (value != null) {
                                    value();
                                  } else {
                                    Navigator.of(context).pop();
                                  }
                                },
                                child: Text(optionTitle),
                              ),
                            );
                          })
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h)
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
