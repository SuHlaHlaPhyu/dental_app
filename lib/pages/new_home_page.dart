import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/patient_horizontal_listview.dart';
import '../custom_widgets/smart_list_view.dart';
import '../custom_widgets/text_widget.dart';
import 'detail_page.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({Key? key}) : super(key: key);

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  List<String> timeList = [
    "8:00",
    "8:30",
    "9:00",
    "9:30",
    "10:00",
    "10:30",
    "11:00",
    "11:30",
    "12:00",
    "12:30",
    "1:00",
    "1:30",
    "2:00",
    "2:30",
    "3:00",
    "3:30",
  ];
  List<int> eventList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: homeBoxDecoration(),
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3.8,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 50.0,
              left: 10.0,
              right: 10.0,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: kToolbarHeight,
                  child: HeaderSectionView(
                    controller: _searchController,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                MyPatientsSectionView(
                  totalPatients: "12 total",
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          PatientHorizontalListSectionView(
                            onTap: () {
                              _navigateToDetailsScreen(context);
                            },
                            isDetail: false,
                          ),
                          const SizedBox(
                            width: 5.0,
                          )
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const TimeAndEventTitleView(),
                const SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToDetailsScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(),
      ),
    );
  }
}

BoxDecoration homeBoxDecoration() {
  return const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromARGB(255, 58, 115, 206),
        Color.fromRGBO(38, 86, 165, 1)
      ],
      begin: FractionalOffset(0.0, 0.0),
      end: FractionalOffset(0.5, 0.0),
      stops: [0.1, 1.0],
      tileMode: TileMode.clamp,
    ),
  );
}

class HeaderSectionView extends StatelessWidget {
  final TextEditingController controller;
  HeaderSectionView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 15 * 15,
          height: 40.0,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            color: Colors.white38,
            borderRadius: BorderRadius.circular(36),
          ),
          child: TextField(
            controller: controller,
            onChanged: (value) {
              //
            },
            cursorColor: Colors.white,
            decoration: const InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none,
              suffixIcon: Icon(Icons.search),
              suffixIconColor: Colors.white,
            ),
          ),
        ),
        const Spacer(),
        Badge(
          badgeContent: TextWidget(text: "1"),
          child: PatientProfileView(
            height: 40.0,
            width: 40.0,
          ),
        ),
      ],
    );
  }
}

class MyPatientsSectionView extends StatelessWidget {
  final String totalPatients;
  MyPatientsSectionView({required this.totalPatients});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: "My Patients",
              isBold: true,
              size: 14,
            ),
            TextWidget(text: "12 total"),
          ],
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 5.0,
          ),
          height: 30.0,
          width: 70.0,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 11, 128, 224),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextWidget(text: "Today"),
              const Spacer(),
              const Icon(
                Icons.arrow_drop_down_outlined,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TimeAndEventTitleView extends StatelessWidget {
  const TimeAndEventTitleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(
          text: "Time",
          color: Colors.black,
          size: 16,
        ),
        const SizedBox(
          width: 60.0,
        ),
        TextWidget(
          text: "Events",
          color: Colors.black,
          size: 16,
        ),
      ],
    );
  }
}

class TimeListView extends StatelessWidget {
  final List<String> timeList;
  final Function onListEndReach;
  TimeListView({required this.timeList, required this.onListEndReach});

  @override
  Widget build(BuildContext context) {
    return timeList.isEmpty
        ? const CircularProgressIndicator()
        : SmartListView(
            itemCount: timeList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                ),
                child: TextWidget(
                  text: timeList[index],
                  color: Colors.grey,
                  size: 13.0,
                ),
              );
            },
            padding: const EdgeInsets.only(
              left: 0,
            ),
            onListEndReached: () {
              onListEndReach();
            },
          );
  }
}

class EventListView extends StatelessWidget {
  final List<int> eventList;
  final Function onTap;
  final Function onListEndReach;
  EventListView({
    required this.eventList,
    required this.onTap,
    required this.onListEndReach,
  });

  @override
  Widget build(BuildContext context) {
    return eventList.isEmpty
        ? const CircularProgressIndicator()
        : SmartListView(
            itemCount: eventList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                child: EventItemView(
                  index: index,
                  onTap: () {
                    onTap();
                  },
                ),
              );
            },
            padding: const EdgeInsets.only(
              left: 0,
            ),
            onListEndReached: () {
              onListEndReach();
            },
          );
  }
}

class EventItemView extends StatelessWidget {
  final Function onTap;
  final int index;
  EventItemView({required this.onTap, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //
        onTap();
      },
      child: Card(
        elevation: index == 0 ? 0.0 : null,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          height: 50.0,
          width: 13 * 13,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.alarm,
                size: 18.0,
                color: Colors.black38,
              ),
              const SizedBox(
                width: 8.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextWidget(
                    text: "Treeth Drilling",
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  TextWidget(
                    text: "8:00 - 8:30",
                    color: Colors.black,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
