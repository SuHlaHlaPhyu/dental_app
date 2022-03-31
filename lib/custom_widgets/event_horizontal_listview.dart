import 'package:dental_app/custom_widgets/patient_horizontal_listview.dart';
import 'package:dental_app/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class EventHorizontalListView extends StatelessWidget {
  const EventHorizontalListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      width: 250,
      decoration: eventBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.punch_clock_sharp,
                    color: Colors.black,
                    size: 10.0,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  TextWidget(
                    text: "8.30 AM - 2.00 PM",
                    color: Colors.black,
                  ),
                ],
              ),
              const Spacer(),
              TextWidget(
                text: "Confirmed",
                color: Colors.green,
              )
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          TextWidget(
            text: "Teeth Drilling",
            isBold: true,
            color: Colors.black,
            size: 13.0,
          ),
          const SizedBox(
            height: 3.0,
          ),
          TextWidget(
            color: Colors.black,
            text:
                "When you visit a dentist for a dental filling, the dentist will first numb the gums to reduce pain.",
          ),
          const Spacer(),
          Row(
            children: [
              PatientProfileView(),
              const SizedBox(
                width: 3.0,
              ),
              TextWidget(
                text: "John Smith",
                color: Colors.black,
              )
            ],
          )
        ],
      ),
    );
  }
}

BoxDecoration eventBoxDecoration() {
  return BoxDecoration(
    color: const Color.fromRGBO(255, 255, 255, 1),
    borderRadius: BorderRadius.circular(5.0),
  );
}
