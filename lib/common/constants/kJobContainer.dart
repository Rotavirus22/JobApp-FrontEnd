import 'package:flutter/material.dart';
import 'package:jobapp/common/ui_helpers.dart';
import 'package:jobapp/themes/app_themes.dart';

class KJobContainer extends StatelessWidget {
  KJobContainer(
      {super.key,
      this.child,
      this.logo,
      this.company,
      this.salaryTitle,
      this.tagTitle,
      this.title});

  final Widget? child;
  final String? logo;
  final String? title;
  final String? company;
  final String? tagTitle;
  final String? salaryTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      height: 113,
      width: 363,
      child: Column(
        children: [
          sHeightSpan,
          Row(
            children: [
              sWidthSpan,
              sWidthSpan,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                height: 40,
                width: 40,
                child: Image.network(logo ?? ''),
              ),
              sWidthSpan,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? 'N/A',
                    style: AppTheme()
                        .lightTheme
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    company ?? 'N/A',
                    style: AppTheme()
                        .lightTheme
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.black, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          sHeightSpan,
          lHeightSpan,
          Row(
            children: [
              sWidthSpan,
              sWidthSpan,
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.grey.shade300),
                height: 21,
                width: 51,
              ),
              sWidthSpan,
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.grey.shade300),
                height: 21,
                width: 51,
              ),
              elWidthSpan,
              elWidthSpan,
              Container(
                child: Text(salaryTitle ?? 'N/A'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
