import 'package:flutter/material.dart';
import 'text_widget.dart';

class PatientHorizontalListSectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: 100.0,
      width: MediaQuery.of(context).size.width / 2,
      decoration: patientBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PlaceAndTimeSectionView(),
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  PatientProfileView(),
                ],
              ),
              const Spacer(),
              Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 11, 128, 224),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 8.0,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class PlaceAndTimeSectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextWidget(
              text: "Office No.238 ",
              isBold: true,
            ),
            TextWidget(
              text: "/ 3 Patients",
            ),
          ],
        ),
        const SizedBox(
          height: 5.0,
        ),
        Row(
          children: [
            const Icon(
              Icons.punch_clock_sharp,
              color: Colors.white,
              size: 10.0,
            ),
            const SizedBox(
              width: 5.0,
            ),
            TextWidget(text: "8.30 AM - 2.00 PM"),
          ],
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

BoxDecoration patientBoxDecoration() {
  return BoxDecoration(
    color: const Color.fromRGBO(47, 106, 192, 1),
    borderRadius: BorderRadius.circular(5.0),
  );
}
