import 'package:flutter/material.dart';
import 'package:task1/bottom_navbar.dart';
import 'package:task1/custom_widgets/container_widget.dart';
import 'package:task1/custom_widgets/custom_row.dart';
import 'package:task1/core/consts/app_color.dart';
import 'package:task1/core/themes/text_style.dart';
import 'package:task1/custom_widgets/event_widget.dart';
import 'custom_widgets/image_widget.dart';
import 'model/api_data.dart';
import 'model/data.dart';
import 'services/remote/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DataModel> programsData = [];
  List<DataModel> lessonsData = [];

  @override
  void initState() {
    super.initState();
    fetchProgramsData();
    fetchLessonsData();
  }

  Future<void> fetchProgramsData() async {
    final List<DataModel> fetchedData = await ApiServices.fetchProgramsData();
    setState(() {
      programsData = fetchedData;
    });
  }

  Future<void> fetchLessonsData() async {
    final List<DataModel> fetchedData = await ApiServices.fetchLessonsData();
    setState(() {
      lessonsData = fetchedData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavbarWidget(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.sort,
                        color: AppColor.iconColor,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.forum_outlined,
                            color: AppColor.iconColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.notifications_outlined,
                            color: AppColor.iconColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  "Hello, Priya!",
                  style: MyTextStyles.headerStyle,
                ),
                Text(
                  "What do you wanna learn today?",
                  style: MyTextStyles.normalTextStyle
                      .copyWith(color: AppColor.greyColor),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ContainerWidget(
                      firstIcon: Icon(
                        Icons.bookmark_outline,
                      ),
                      textName: "Programs",
                    ),
                    ContainerWidget(
                      firstIcon: Icon(Icons.help_rounded),
                      textName: "Get help",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ContainerWidget(
                      firstIcon: Icon(Icons.book_outlined),
                      textName: "Learn",
                    ),
                    ContainerWidget(
                      firstIcon: Icon(Icons.bar_chart_outlined),
                      textName: "DD Tracker",
                    ),
                  ],
                ),
                CustomRow(
                  text: "Programs for you",
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: programsData.length,
                    itemBuilder: (context, index) {
                      final item = programsData[index];
                      return ImageWidget(
                        data: item,
                        displayType: 'lessons',
                      );
                    },
                  ),
                ),
                CustomRow(
                  text: "Events and experiences",
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dynamicData2.length,
                    itemBuilder: (context, index) {
                      final item = dynamicData2[index];
                      return EventWidget(
                        imagePath: item['imagePath'],
                        heading: item['heading']!,
                        title: item['title']!,
                        subtitle: item['subtitle']!,
                        showBookOption: true,
                      );
                    },
                  ),
                ),
                CustomRow(
                  text: "Lessons for you",
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: lessonsData.length,
                    itemBuilder: (context, index) {
                      final item = lessonsData[index];
                      return ImageWidget(
                        data: item,
                        displayType: 'duration',
                        
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
