import 'package:flutter/material.dart';
import 'package:order_tracker_zen/order_tracker_zen.dart';
import 'package:winkle_final/views/main_screen.dart';



/// OrderTrackZenWidget is a StatelessWidget that wraps the OrderTrackerZen widget.
class OrderTrackZenWidget extends StatelessWidget {
  const OrderTrackZenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Tracker Zen"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Add padding around the OrderTrackerZen widget for better presentation.
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: OrderTrackerZen(
                tracker_data: [
                  TrackerData(
                    title: "Order Placed",
                    date: "Sat, 8 Apr '22",
                    tracker_details: [
                      TrackerDetails(
                        title: "Your order was placed on Zenzzen",
                        datetime: "Sat, 8 Apr '22 - 17:17",
                      ),
                      TrackerDetails(
                        title: "Zenzzen Arranged A Callback Request",
                        datetime: "Sat, 8 Apr '22 - 17:42",
                      ),
                    ],
                  ),
                  TrackerData(
                    title: "Order Shipped",
                    date: "Sat, 8 Apr '22",
                    tracker_details: [
                      TrackerDetails(
                        title: "Your order was shipped with MailDeli",
                        datetime: "Sat, 8 Apr '22 - 17:50",
                      ),
                    ],
                  ),
                  TrackerData(
                    title: "Order Delivered",
                    date: "Sat, 8 Apr '22",
                    tracker_details: [
                      TrackerDetails(
                        title: "You received your order, by MailDeli",
                        datetime: "Sat, 8 Apr '22 - 17:51",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Add a button to navigate to the HomeScreen
            ElevatedButton(
              onPressed: () {
                // Navigate to HomeScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                );
              },
              child: const Text("Go to Home Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
