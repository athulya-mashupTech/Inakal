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
        // title: const Text("Requests"),
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
        children: [ // Custom widget for Sent tab
          ReceivedRequests(),
          SendRequests(),
        ],
      ),
    );
  }
}
