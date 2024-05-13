import 'package:flutter/material.dart';
import 'package:jobapp/common/ui_helpers.dart';
import 'package:jobapp/themes/app_themes.dart';

class KHomeContainer extends StatelessWidget {
  const KHomeContainer(
      {super.key,
      this.image,
      this.company,
      this.title,
      this.location,
      this.salary});

  final String? image;
  final String? company;
  final String? title;
  final String? location;
  final String? salary;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      color: Colors.grey.shade200,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sHeightSpan,
            Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  child: Image.network(image ?? ''),
                ),
                lWidthSpan,
                Text(
                  company ?? 'N/A',
                  style: AppTheme()
                      .lightTheme
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            lHeightSpan,
            Text(
              title ?? 'N/A',
              style: AppTheme()
                  .lightTheme
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              location ?? 'N/A',
              style: AppTheme().lightTheme.textTheme.bodySmall,
            ),
            lHeightSpan,
            Text(salary ?? 'N/A'),
          ],
        ),
      ),
    );
  }
}
