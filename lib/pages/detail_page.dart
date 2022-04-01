import 'package:dental_app/custom_painter/custom_clock.dart';
import 'package:dental_app/custom_widgets/patient_horizontal_listview.dart';
import 'package:dental_app/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  decoration: linearBoxDecoration(),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                ),
                Container(
                  decoration: blueBoxDecoration(),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                ),
              ],
            ),
          ),
          Positioned(
            left: 10.0,
            right: 10.0,
            top: 30.0,
            child: SizedBox(
              height: kToolbarHeight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  TextWidget(
                    text: "Today",
                    isBold: true,
                    size: 13.0,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 200,
              width: 200,
              child: CustomPaint(
                painter: CustomClock(),
              ),
            ),
          ),
          Positioned(
            left: 10.0,
            right: 10.0,
            bottom: MediaQuery.of(context).size.height / 8.9,
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      PatientHorizontalListSectionView(
                        isDetail: true,
                        onTap: () {
                          _navigateToDetailsScreen(BuildContext context) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(),
                              ),
                            );
                          }
                        },
                      ),
                      const SizedBox(
                        width: 5.0,
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          // Positioned(
          //   left: 10.0,
          //   right: 10.0,
          //   bottom: MediaQuery.of(context).size.height / 3.5,
          //   child: SizedBox(
          //     height: 150,
          //     child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       shrinkWrap: true,
          //       physics: const AlwaysScrollableScrollPhysics(),
          //       itemCount: 5,
          //       itemBuilder: (BuildContext context, int index) {
          //         return Row(
          //           children: const [
          //             EventHorizontalListView(),
          //             SizedBox(
          //               width: 5.0,
          //             )
          //           ],
          //         );
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

BoxDecoration linearBoxDecoration() {
  return const BoxDecoration(
    gradient: LinearGradient(
      colors: [Color.fromRGBO(45, 96, 183, 1), Color.fromRGBO(33, 79, 157, 1)],
      begin: FractionalOffset(0.0, 0.0),
      end: FractionalOffset(0.5, 0.0),
      stops: [0.1, 1.0],
      tileMode: TileMode.clamp,
    ),
  );
}

BoxDecoration blueBoxDecoration() {
  return const BoxDecoration(
    color: Color.fromRGBO(26, 69, 140, 1),
  );
}
