import 'package:flutter/material.dart';
import 'package:jobapp/common/constants/customAppBar.dart';
import 'package:jobapp/common/constants/k_button.dart';
import 'package:jobapp/common/constants/text_field.dart';
import 'package:jobapp/common/ui_helpers.dart';
import 'package:jobapp/main.dart';
import 'package:jobapp/provider/features/getJobs.dart';
import 'package:jobapp/themes/app_themes.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final jobState = Provider.of<JobState>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: Padding(
      //     padding: EdgeInsets.only(left: 2),
      //     child: Text('JobTree'),
      //   ),
      // ),
      body: jobState.isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Stack(
                children: [
                  const CustomAppBar(),
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16, 140, 16, 0),
                        child: kTextFormFIeld(
                          onChanged: null,
                          obscureText: false,
                          suffixIcon: Icon(Icons.search_outlined),
                          hintText: 'Search',
                        ),
                      ),
                      lHeightSpan,
                      xsHeightSpan,
                      const Text(
                        'Recommended Jobs',
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 1),
                          itemCount: jobState.jobModel!.data!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Container(
                                          width: 380,
                                          height: 500,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              children: [
                                                lHeightSpan,
                                                Text('Job Details'),
                                                SingleChildScrollView(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      lHeightSpan,
                                                      Row(
                                                        children: [
                                                          lWidthSpan,
                                                          Text(
                                                            jobState
                                                                .jobModel!
                                                                .data![index]
                                                                .jobTitle!,
                                                            style: AppTheme()
                                                                .lightTheme
                                                                .textTheme
                                                                .bodyMedium!
                                                                .copyWith(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                          ),
                                                          // Expanded(
                                                          //   child: Align(
                                                          //     alignment: Alignment.topRight,
                                                          //     child: Container(
                                                          //       decoration: BoxDecoration(
                                                          //           borderRadius:
                                                          //               BorderRadius.circular(10),
                                                          //           color: Colors.yellow),
                                                          //       child: const Text('New'),
                                                          //     ),
                                                          //   ),
                                                          // ),
                                                          lWidthSpan,
                                                          mWidthSpan,
                                                        ],
                                                      ),
                                                      sHeightSpan,
                                                      Row(
                                                        children: [
                                                          lWidthSpan,
                                                          Icon(
                                                            Icons
                                                                .newspaper_outlined,
                                                            size: 15,
                                                          ),
                                                          mWidthSpan,
                                                          Text(
                                                            jobState
                                                                .jobModel!
                                                                .data![index]
                                                                .company!,
                                                            style: AppTheme()
                                                                .lightTheme
                                                                .textTheme
                                                                .bodySmall!
                                                                .copyWith(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        15),
                                                          ),
                                                        ],
                                                      ),
                                                      sHeightSpan,
                                                      Row(
                                                        children: [
                                                          lWidthSpan,
                                                          Icon(
                                                            Icons
                                                                .location_city_outlined,
                                                            size: 15,
                                                          ),
                                                          mWidthSpan,
                                                          Text(
                                                            jobState
                                                                .jobModel!
                                                                .data![index]
                                                                .location!,
                                                            style: AppTheme()
                                                                .lightTheme
                                                                .textTheme
                                                                .bodySmall!
                                                                .copyWith(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        15),
                                                          ),
                                                        ],
                                                      ),
                                                      lHeightSpan,
                                                      Column(
                                                        children: [
                                                          Text(
                                                            'Job Description',
                                                            style: AppTheme()
                                                                .lightTheme
                                                                .textTheme
                                                                .bodyMedium!,
                                                          ),
                                                          sHeightSpan,
                                                          Text(
                                                            jobState
                                                                .jobModel!
                                                                .data![index]
                                                                .jobDescription!,
                                                            style: AppTheme()
                                                                .lightTheme
                                                                .textTheme
                                                                .bodySmall!
                                                                .copyWith(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        15),
                                                          ),
                                                        ],
                                                      ),
                                                      lHeightSpan,
                                                      Row(
                                                        children: [
                                                          lWidthSpan,
                                                          Column(
                                                            children: [
                                                              Text(
                                                                'Salary',
                                                                style: AppTheme()
                                                                    .lightTheme
                                                                    .textTheme
                                                                    .bodyMedium!,
                                                              ),
                                                              Text(
                                                                jobState
                                                                    .jobModel!
                                                                    .data![
                                                                        index]
                                                                    .estimatedSalary!,
                                                                style: AppTheme()
                                                                    .lightTheme
                                                                    .textTheme
                                                                    .bodySmall!
                                                                    .copyWith(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            15),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment: FractionalOffset
                                                        .bottomCenter,
                                                    child: SizedBox(
                                                      child: KButton(
                                                        onPressed: () {
                                                          navigagorKey
                                                              .currentState!
                                                              .pushNamed(
                                                                  '/applyScreen',
                                                                  arguments: {
                                                                'title': jobState
                                                                    .jobModel!
                                                                    .data![
                                                                        index]
                                                                    .jobTitle,
                                                                'salary': jobState
                                                                    .jobModel!
                                                                    .data![
                                                                        index]
                                                                    .estimatedSalary,
                                                                'id': jobState
                                                                    .jobModel!
                                                                    .data![
                                                                        index]
                                                                    .sId,
                                                                'company': jobState
                                                                    .jobModel!
                                                                    .data![
                                                                        index]
                                                                    .company,
                                                                'location': jobState
                                                                    .jobModel!
                                                                    .data![
                                                                        index]
                                                                    .location,
                                                              });
                                                        },
                                                        child: Text('Apply'),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 0, 25, 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        12), // Adjust the radius as needed
                                  ),
                                  height: 93,
                                  width: 370,
                                  child: Column(
                                    children: [
                                      sHeightSpan,
                                      Row(
                                        children: [
                                          lWidthSpan,
                                          lWidthSpan,
                                          Text(
                                            jobState.jobModel!.data![index]
                                                .jobTitle!,
                                            style: AppTheme()
                                                .lightTheme
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(fontSize: 15),
                                          ),
                                          // Expanded(
                                          //   child: Align(
                                          //     alignment: Alignment.topRight,
                                          //     child: Container(
                                          //       decoration: BoxDecoration(
                                          //           borderRadius:
                                          //               BorderRadius.circular(10),
                                          //           color: Colors.yellow),
                                          //       child: const Text('New'),
                                          //     ),
                                          //   ),
                                          // ),
                                          lWidthSpan,
                                          mWidthSpan,
                                        ],
                                      ),
                                      sHeightSpan,
                                      Row(
                                        children: [
                                          lWidthSpan,
                                          Icon(
                                            Icons.newspaper_outlined,
                                            size: 12,
                                          ),
                                          mWidthSpan,
                                          Text(
                                            jobState.jobModel!.data![index]
                                                .company!,
                                            style: AppTheme()
                                                .lightTheme
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      sHeightSpan,
                                      Row(
                                        children: [
                                          lWidthSpan,
                                          Icon(
                                            Icons.location_city_outlined,
                                            size: 12,
                                          ),
                                          mWidthSpan,
                                          Text(
                                            jobState.jobModel!.data![index]
                                                .location!,
                                            style: AppTheme()
                                                .lightTheme
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
