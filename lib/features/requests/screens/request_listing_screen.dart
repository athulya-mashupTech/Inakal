import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/requests/screens/received_requests.dart';
import 'package:inakal/features/requests/screens/send_requests.dart';

class RequestListingScreen extends StatefulWidget {
  const RequestListingScreen({super.key});

  @override
  State<RequestListingScreen> createState() => _RequestListingScreenState();
}

class _RequestListingScreenState extends State<RequestListingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20),
          child: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'All ',
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                TextSpan(
                  text: 'Requests',
                  style: TextStyle(
                    color: AppColors.primaryRed,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottom: TabBar(
          dividerColor: AppColors.primaryRed.withAlpha(20),
          labelColor: AppColors.primaryRed,
          indicatorColor: AppColors.primaryRed,
          controller: _tabController,
          tabs: const [
            Tab(text: "Received"),
            Tab(text: "Sent"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        // Custom widget for Sent tab
        children: const [
          ReceivedRequests(),
          SendRequests(),
        ],
      ),
    );
  }
}
