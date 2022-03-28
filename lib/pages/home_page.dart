import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/patient_horizontal_listview.dart';
import '../custom_widgets/text_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> testList = [1, 2, 3, 4, 5];

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: homeBoxDecoration(),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 3.8,
              ),
            ),
            Positioned(
              left: 30.0,
              right: 40.0,
              top: 6 * 6,
              child: HeaderSectionView(
                controller: _searchController,
              ),
            ),
            Positioned(
              left: 30.0,
              right: 40.0,
              top: 10.5 * 10.5,
              child: MyPatientsSectionView(
                totalPatients: "12 total",
              ),
            ),
            Positioned(
              left: 30.0,
              top: 13 * 13,
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        PatientHorizontalListSectionView(),
                        const SizedBox(
                          width: 5.0,
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
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
