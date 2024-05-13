import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jobapp/common/app_images.dart';
import 'package:jobapp/common/constants/drawer.dart';
import 'package:jobapp/common/constants/kHomeContainer.dart';
import 'package:jobapp/common/ui_helpers.dart';
import 'package:jobapp/main.dart';
import 'package:jobapp/provider/bottomState/bottomState.dart';
import 'package:jobapp/provider/features/getJobs.dart';
import 'package:jobapp/themes/app_themes.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final jobState = Provider.of<JobState>(context);
    final bottomState = Provider.of<BottomState>(context);
    return jobState.isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            drawer: KDrawer(),
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Hero(
                tag: 'search',
                child: SizedBox(
                  width: 260,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/search');
                    },
                    child: Text(
                      'Search',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: GestureDetector(
                    onTap: () {
                      navigagorKey.currentState!.pushNamed('/profile');
                    },
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          jobState.dashBoardModel?.data?.profilePicture ?? ''),
                    ),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    elHeightSpan,
                    Stack(
                      children: [
                        SizedBox(
                          height: 250,
                          width: double.infinity,
                          child: CarouselSlider(
                              items: [
                                Image.asset(AppImages.carImage1),
                                Image.asset(AppImages.carImage2),
                                Image.asset(AppImages.carImage3),
                              ],
                              options: CarouselOptions(
                                height: 250,
                                aspectRatio: 16 / 9,
                                viewportFraction: 1.0,
                                initialPage: 0,
                                enableInfiniteScroll: false,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.3,
                                onPageChanged: bottomState.onCarChanged,
                                scrollDirection: Axis.horizontal,
                              )),
                        ),
                        Positioned(
                          bottom: 40.0,
                          left: 0.0,
                          right: 0.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List<Widget>.generate(3, (index) {
                              return Container(
                                width: 8.0,
                                height: 8.0,
                                margin: EdgeInsets.symmetric(horizontal: 2.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: bottomState.current == index
                                      ? appPrimColor
                                      : Colors.grey,
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),

                    lHeightSpan,
                    lHeightSpan,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Recommended Jobs',
                              style: TextStyle(color: Colors.black),
                            ),
                            elWidthSpan,
                            elWidthSpan,
                            lWidthSpan,
                            TextButton(
                              onPressed: () {},
                              child: Text('See All'),
                            ),
                          ],
                        ),
                        lHeightSpan,
                        SizedBox(
                          height: 200,
                          child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: jobState.jobModel?.data?.length ?? 0,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 30),
                              itemBuilder: (context, index) {
                                var jobIndex = jobState.jobModel?.data?[index];
                                return GestureDetector(
                                  onTap: () {
                                    navigagorKey.currentState!
                                        .pushNamed('/details', arguments: {
                                      'userId': jobState
                                          .jobModel?.data?[index].userId,
                                      'userName': jobState
                                          .jobModel?.data?[index].userName,
                                      'userImage': jobState
                                          .jobModel?.data?[index].userImage,
                                      'title': jobState
                                          .jobModel?.data?[index].jobTitle,
                                      'salary': jobState.jobModel?.data?[index]
                                          .estimatedSalary,
                                      'id': jobState.jobModel?.data?[index].sId,
                                      'company': jobState
                                          .jobModel?.data?[index].company,
                                      'location': jobState
                                          .jobModel?.data?[index].location,
                                      'description': jobState
                                          .jobModel?.data?[index].jobDescription
                                    });
                                  },
                                  child: KHomeContainer(
                                    company: jobIndex?.company,
                                    image: jobIndex?.userImage,
                                    title: jobIndex?.jobTitle,
                                    location: jobIndex?.location,
                                    salary: jobIndex?.estimatedSalary,
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                    elHeightSpan,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Popular Jobs',
                              style: TextStyle(color: Colors.black),
                            ),
                            elWidthSpan,
                            elWidthSpan,
                            elWidthSpan,
                            elWidthSpan,
                            TextButton(
                              onPressed: () {},
                              child: Text('See All'),
                            ),
                          ],
                        ),
                        lHeightSpan,
                        SizedBox(
                          height: 200,
                          child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: jobState.jobModel?.data?.length ?? 0,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 30),
                              itemBuilder: (context, index) {
                                var jobIndex = jobState.jobModel?.data?[index];
                                return GestureDetector(
                                  onTap: () {
                                    navigagorKey.currentState!
                                        .pushNamed('/details', arguments: {
                                      'userId': jobState
                                          .jobModel!.data![index].userId,
                                      'userName': jobState
                                          .jobModel!.data![index].userName,
                                      'userImage': jobState
                                          .jobModel!.data![index].userImage,
                                      'title': jobState
                                          .jobModel!.data![index].jobTitle,
                                      'salary': jobState.jobModel!.data![index]
                                          .estimatedSalary,
                                      'id': jobState.jobModel!.data![index].sId,
                                      'company': jobState
                                          .jobModel!.data![index].company,
                                      'location': jobState
                                          .jobModel!.data![index].location,
                                      'description': jobState
                                          .jobModel!.data![index].jobDescription
                                    });
                                  },
                                  child: jobState.jobModel!.data!.isEmpty
                                      ? Container(
                                          child: Text('No Job Found'),
                                        )
                                      : KHomeContainer(
                                          company: jobIndex?.company,
                                          image: jobIndex?.userImage,
                                          title: jobIndex?.jobTitle,
                                          location: jobIndex?.location,
                                          salary: jobIndex?.estimatedSalary,
                                        ),
                                );
                              }),
                        ),
                      ],
                    ),

                    // SizedBox(
                    //   child: ListView.separated(
                    //     shrinkWrap: true,
                    //     separatorBuilder: (context, index) =>
                    //         const SizedBox(height: 1),
                    //     itemCount: jobState.jobModel!.data!.length,
                    //     itemBuilder: (context, index) {
                    //       return GestureDetector(
                    //         onTap: () {
                    // navigagorKey.currentState!
                    //     .pushNamed('/details', arguments: {
                    //   'title':
                    //       jobState.jobModel!.data![index].jobTitle,
                    //   'salary': jobState
                    //       .jobModel!.data![index].estimatedSalary,
                    //   'id': jobState.jobModel!.data![index].sId,
                    //   'company':
                    //       jobState.jobModel!.data![index].company,
                    //   'location':
                    //       jobState.jobModel!.data![index].location,
                    //   'description': jobState
                    //       .jobModel!.data![index].jobDescription
                    // });
                    //         },
                    //         child: Padding(
                    //           padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                    //           child: KJobContainer(
                    //             logo: AppImages.googleIcon,
                    //             title: jobState.jobModel!.data![index].jobTitle,
                    //             company:
                    //                 jobState.jobModel!.data![index].company,
                    //             salaryTitle: jobState
                    //                 .jobModel!.data![index].estimatedSalary,
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          );
  }
}
