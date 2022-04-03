import 'package:dental_app/custom_widgets/smart_list_view.dart';
import 'package:dental_app/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

class TimeEventListView extends StatefulWidget {
  const TimeEventListView({Key? key}) : super(key: key);

  @override
  State<TimeEventListView> createState() => _TimeEventListViewState();
}

class _TimeEventListViewState extends State<TimeEventListView> {
  List<String> timeList = [
    "8:00",
    "8:30",
    "9:00",
    "9:30",
    "10:00",
    "10:30",
    "11:00",
    "11:30",
  ];
  List<int> eventList = [
    1,
    2,
    3,
    4,
  ];

  List<int> timeLine = [1, 2];
  Future<void> _pulTolRefresh() async {
    setState(() {
      _showSnackBar("Refresh");
    });
  }

  void _showSnackBar(String message) {
    var snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _pulTolRefresh,
      child: SmartListView(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Row(
              children: [
                SizedBox(
                  width: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: "Time",
                        isBold: true,
                        color: Colors.black,
                        size: 18.0,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: timeList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15.0,
                              ),
                              child: TextWidget(
                                text: timeList[index],
                                color: Colors.black,
                              ),
                            );
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: timeList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Visibility(
                            visible: index > 0,
                            child: Container(
                              width: 2,
                              height: 50,
                              color: Colors.black54,
                            ),
                          ),
                          Visibility(
                            visible: index == 0,
                            child: Column(
                              children: [
                                const DottedLine(
                                  direction: Axis.vertical,
                                  lineLength: 80,
                                  dashLength: 3,
                                  lineThickness: 2,
                                  dashColor: Colors.black,
                                ),
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                SizedBox(
                  width: 170,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: "Events",
                        isBold: true,
                        color: Colors.black,
                        size: 18.0,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: eventList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15.0,
                              ),
                              child: EventItemView(
                                onTap: () {},
                                index: eventList[index],
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ],
            );
          },
          padding: const EdgeInsets.all(0.0),
          onListEndReached: () {
            _showSnackBar("No more data");
          }),
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
        elevation: index == 0 ? 0.0 : 1.0,
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

class ItemDividerView extends StatelessWidget {
  const ItemDividerView({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: index > 0,
          child: Container(
            width: 2,
            height: 120,
            color: Colors.black54,
          ),
        ),
        Visibility(
          visible: index == 0,
          child: Column(
            children: [
              const DottedLine(
                direction: Axis.vertical,
                lineLength: 120,
                dashLength: 3,
                lineThickness: 2,
                dashColor: Colors.black,
              ),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
