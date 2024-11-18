import 'package:flutter/material.dart';
import '../../../shared/widgets/separator.dart';
import '../../../state_util.dart';
import '../../main_navigation/view/main_navigation_view.dart';
import '../../seat_picker/view/seat_picker_view.dart';
import '../controller/booking_detail_controller.dart';

class BookingDetailView extends StatefulWidget {
  const BookingDetailView({Key? key}) : super(key: key);

  Widget build(context, BookingDetailController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Ticket",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.file_upload_outlined,
                size: 28.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.offAll(MainNavigationView()),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 24.0,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff2B3A4E),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xffF5F5F5),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 15.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 60,
                      left: -20,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Color(0xffC0C9D2).withOpacity(0.4),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      right: -20,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Color(0xffC0C9D2).withOpacity(0.4),
                      ),
                    ),
                    Positioned(
                      top: 80,
                      left: 18,
                      right: 18,
                      child: const Separator(),
                    ),
                    Positioned(
                      bottom: 130,
                      left: -20,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Color(0xffC0C9D2).withOpacity(0.4),
                      ),
                    ),
                    Positioned(
                      bottom: 130,
                      right: -20,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Color(0xffC0C9D2).withOpacity(0.4),
                      ),
                    ),
                    Positioned(
                      bottom: 150,
                      left: 18,
                      right: 18,
                      child: const Separator(),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          _buildRow("Executive Class", "18 June 2013"),
                          SizedBox(height: 24.0),
                          _buildRouteInfo("From", "Pati", "To", "Kudus"),
                          SizedBox(height: 24.0),
                          _buildRouteInfo(
                              "Departure", "08:00 AM", "Arrival", "09:00 AM"),
                          SizedBox(height: 24.0),
                          _buildRouteInfo(
                              "Class", "Executive", "Seat", "Seat 12"),
                          SizedBox(height: 24.0),
                          _buildRouteInfo(
                              "Passenger", "1 Adult", "Baggage", "15 KG"),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          "assets/images/qr.png",
                          width: 120.0,
                          height: 120.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            SizedBox(
              height: 48,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff546E7A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                ),
                onPressed: () => Get.to(const SeatPickerView()),
                child: const Text(
                  "Download Ticket",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildRouteInfo(String leftLabel, String leftValue, String rightLabel,
      String rightValue) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                leftLabel,
                style: TextStyle(
                  color: Color(0xffA1A1A1),
                  fontSize: 14.0,
                ),
              ),
              Text(
                leftValue,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color(0xff3A3A3A),
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                rightLabel,
                style: TextStyle(
                  color: Color(0xffA1A1A1),
                  fontSize: 14.0,
                ),
              ),
              Text(
                rightValue,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color(0xff3A3A3A),
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Row _buildRow(String left, String right) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          left,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xff3A3A3A),
          ),
        ),
        Text(
          right,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Color(0xff3A3A3A),
          ),
        ),
      ],
    );
  }

  @override
  State<BookingDetailView> createState() => BookingDetailController();
}
