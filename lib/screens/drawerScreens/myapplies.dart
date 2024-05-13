import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jobapp/common/constants/kJobContainer.dart';
import 'package:jobapp/provider/features/get_apply.dart';
import 'package:provider/provider.dart';

class MyApplies extends StatelessWidget {
  const MyApplies({super.key});

  @override
  Widget build(BuildContext context) {
    final applyState = Provider.of<MyApply>(context);
    return applyState.isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: applyState.applyModel?.data?.length ?? 0,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 5,
                        );
                      },
                      itemBuilder: (context, index) {
                        var applyIndex = applyState.applyModel?.data?[index];
                        String? dateString =
                            applyState.applyModel?.data?[index].createdAt ?? '';
                        DateTime dateTime = DateTime.parse(dateString);
                        String formattedDate =
                            DateFormat.MMMMd().format(dateTime);
                        return KJobContainer(
                          title: applyIndex?.jobName,
                          logo: applyIndex?.userImage,
                          company: applyIndex?.jobCompany,
                          salaryTitle: "Demanded ${applyIndex?.expectedSalary}",
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
