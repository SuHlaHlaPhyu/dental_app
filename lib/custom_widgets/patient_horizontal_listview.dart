import 'package:flutter/material.dart';
import 'text_widget.dart';

class PatientHorizontalListSectionView extends StatelessWidget {
  final Function onTap;
  final bool isDetail;
  PatientHorizontalListSectionView(
      {required this.onTap, required this.isDetail});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 100.0,
        width: MediaQuery.of(context).size.width / 2,
        decoration: patientBoxDecoration(isDetail),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlaceAndTimeSectionView(
              isDetail: isDetail,
            ),
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
      ),
    );
  }
}

class PlaceAndTimeSectionView extends StatelessWidget {
  final bool isDetail;
  PlaceAndTimeSectionView({required this.isDetail});
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
              color: isDetail ? Colors.black : Colors.white,
            ),
            TextWidget(
                text: "/ 3 Patients",
                color: isDetail ? Colors.black : Colors.white),
          ],
        ),
        const SizedBox(
          height: 5.0,
        ),
        Row(
          children: [
            Icon(
              Icons.punch_clock_sharp,
              color: isDetail ? Colors.black : Colors.white,
              size: 10.0,
            ),
            const SizedBox(
              width: 5.0,
            ),
            TextWidget(
                text: "8.30 AM - 2.00 PM",
                color: isDetail ? Colors.black : Colors.white),
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

BoxDecoration patientBoxDecoration(bool isDetail) {
  return BoxDecoration(
    color: isDetail ? Colors.white : const Color.fromRGBO(47, 106, 192, 1),
    borderRadius: BorderRadius.circular(5.0),
  );
}
