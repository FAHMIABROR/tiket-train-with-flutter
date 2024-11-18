import 'package:flutter/material.dart';

import '../../../shared/widgets/category_picker.dart';
import '../../../shared/widgets/datepicker.dart';
import '../../../shared/widgets/dropdown.dart';
import '../../../state_util.dart';
import '../../seat_picker/view/seat_picker_view.dart';
import '../controller/dashboard_controller.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => DashboardController();

  build(BuildContext context, DashboardController dashboardController) {}
}

class DashboardController extends State<DashboardView> {
  DashboardView? view;
  int qtyAdult = 0;
  int qtyChild = 0;

  void incrementAdult() {
    setState(() {
      qtyAdult++;
    });
  }

  void decrementAdult() {
    if (qtyAdult > 0) {
      setState(() {
        qtyAdult--;
      });
    }
  }

  void incrementChild() {
    setState(() {
      qtyChild++;
    });
  }

  void decrementChild() {
    if (qtyChild > 0) {
      setState(() {
        qtyChild--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF333A5A),
        title: const Text(
          "Hello, Samuel",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Badge(
              label: Text(
                "4",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              child: Icon(
                Icons.notifications_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Book Your Ticket Today",
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333A5A),
                ),
              ),
              const SizedBox(height: 16.0),
              Theme(
                data: ThemeData.light(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      QCategoryPicker(
                        items: const [
                          {"label": "One Way", "value": "1"},
                          {"label": "Round - Trip", "value": "2"},
                          {"label": "Multiple City", "value": "3"},
                        ],
                        value: "1",
                        onChanged: (index, label, value, item) {},
                      ),
                      const SizedBox(height: 15.0),
                      QDropdownField(
                        label: "From",
                        value: "Pati",
                        items: const [
                          {"label": "Pati", "value": "Pati"},
                          {"label": "Kudus", "value": "Kudus"}
                        ],
                        onChanged: (value, label) {},
                      ),
                      QDropdownField(
                        label: "To",
                        value: "Kudus",
                        items: const [
                          {"label": "Pati", "value": "Pati"},
                          {"label": "Kudus", "value": "Kudus"}
                        ],
                        onChanged: (value, label) {},
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: QDatePicker(
                              label: "Depart",
                              value: DateTime.now(),
                              onChanged: (value) {},
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          const Text(
                            "-",
                            style: TextStyle(
                              fontSize: 22.0,
                              color: Color(0xFF333A5A),
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          Expanded(
                            child: QDatePicker(
                              label: "Return",
                              value: DateTime.now(),
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "Passengers",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xFF333A5A),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: decrementAdult,
                                child: Container(
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    color: (qtyAdult == 0)
                                        ? const Color(0xFFE0E0E0)
                                        : const Color(0xFF333A5A),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    size: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              Text(
                                "$qtyAdult Adult",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF333A5A),
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              InkWell(
                                onTap: incrementAdult,
                                child: Container(
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF333A5A),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    size: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              InkWell(
                                onTap: decrementChild,
                                child: Container(
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    color: (qtyChild == 0)
                                        ? const Color(0xFFE0E0E0)
                                        : const Color(0xFF333A5A),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    size: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              Text(
                                "$qtyChild Child",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF333A5A),
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              InkWell(
                                onTap: incrementChild,
                                child: Container(
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF333A5A),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    size: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      QDropdownField(
                        label: "Train Classes",
                        value: "Executive",
                        items: const [
                          {"label": "Executive", "value": "Executive"},
                          {"label": "Business", "value": "Business"},
                          {"label": "Economy", "value": "Economy"}
                        ],
                        onChanged: (value, label) {},
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        height: 48,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF333A5A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () => Get.to(SeatPickerView()),
                          child: const Text(
                            "Continue",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
