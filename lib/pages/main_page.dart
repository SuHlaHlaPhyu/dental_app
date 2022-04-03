import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/patient_horizontal_listview.dart';
import '../custom_widgets/text_widget.dart';
import '../custom_widgets/time_event_listview.dart';
import 'detail_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: homeBoxDecoration(),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 3.5,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
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
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 70, left: 16),
                height: MediaQuery.of(context).size.height * 0.7,
                child: const TimeEventListView(),
              )
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 4.2,
            left: 1,
            right: 1,
            child: SizedBox(
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
          )
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

class PatientProfileView extends StatelessWidget {
  final double height;
  final double width;
  PatientProfileView({
    this.height = 20,
    this.width = 20,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            'https://www.whatsappimages.in/wp-content/uploads/2021/02/Beautiful-Girls-Whatsapp-DP-Profile-Images-pics-for-download-300x300.gif',
          ),
        ),
      ),
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
