import 'package:flutter/material.dart';
import '../../../shared/widgets/category_picker.dart';
import '../../../state_util.dart';
import '../../booking_detail/view/booking_detail_view.dart';
import '../controller/seat_picker_controller.dart';

class SeatPickerView extends StatefulWidget {
  const SeatPickerView({Key? key}) : super(key: key);

  Widget build(context, SeatPickerController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Select Seat",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [],
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 24.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.square,
                    size: 24.0,
                    color: Color(0xFF4CAF50), // Softer green for "Available"
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    "Available",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Icon(
                    Icons.square,
                    size: 24.0,
                    color: Color(0xFFFFC107), // Softer yellow for "Selected"
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    "Selected",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Icon(
                    Icons.square,
                    size: 24.0,
                    color: Color(0xFFBDBDBD), // Light grey for "Unavailable"
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    "Unavailable",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.elliptical(150.0, 300.0),
                            topRight: Radius.elliptical(150.0, 300.0),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 40,
                              left: 30,
                              right: 30,
                              child: Container(
                                height: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFBDBDBD),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.elliptical(200.0, 300.0),
                                    topRight: Radius.elliptical(200.0, 300.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF1E88E5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () =>
                                    Get.offAll(const BookingDetailView()),
                                child: const Text(
                                  "Executive",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: LayoutBuilder(
                                  builder: (context, constraints) {
                                double spacing = 6;
                                var size = (constraints.biggest.width / 5.8);
                                return Wrap(
                                  runSpacing: spacing,
                                  spacing: spacing,
                                  children: List.generate(
                                    60,
                                    (index) {
                                      var number = (index + 1)
                                          .toString()
                                          .padLeft(2, "0");
                                      bool selected =
                                          controller.usedSeats.contains(index);
                                      bool selectedSeatByOther = controller
                                          .selectedSeats
                                          .contains(index);

                                      var color = const Color(0xFF4CAF50);
                                      if (selectedSeatByOther) {
                                        color = const Color(0xFFBDBDBD);
                                      } else if (selected) {
                                        color = const Color(0xFFFFC107);
                                      }

                                      return InkWell(
                                        onTap: () =>
                                            controller.updateSeat(index),
                                        child: Container(
                                          height: size,
                                          width: size,
                                          margin: EdgeInsets.only(
                                              right: (index + 1) % 2 == 0 &&
                                                      (index + 1) % 4 != 0
                                                  ? 20
                                                  : 0),
                                          decoration: BoxDecoration(
                                            color: color,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(
                                                8.0,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              number,
                                              style: TextStyle(
                                                  color: selectedSeatByOther
                                                      ? Colors.grey[500]
                                                      : selected
                                                          ? const Color(
                                                              0xff393e48)
                                                          : Colors.white,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Wrap(
        runSpacing: 10,
        spacing: 10,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color(0xFFFFC107),
                  width: 4.0,
                ),
              ),
            ),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Selected Seat",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFFBDBDBD),
                      ),
                    ),
                    Text(
                      "Executive. Seat 12",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Price",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFFBDBDBD),
                      ),
                    ),
                    Text(
                      "\$104.00",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  height: 48,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5E35B1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () => Get.offAll(const BookingDetailView()),
                    child: const Text(
                      "Confirm Seat",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  State<SeatPickerView> createState() => SeatPickerController();
}
