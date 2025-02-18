import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:inakal/common/screen/network_service.dart';

class NoInternetChecker extends StatefulWidget {
  final Widget child;

  const NoInternetChecker({super.key, required this.child});

  @override
  State<NoInternetChecker> createState() => _NoInternetCheckerState();
}

class _NoInternetCheckerState extends State<NoInternetChecker> {
  bool _isOffline = false;

  @override
  void initState() {
    super.initState();
    _checkInternetOnLaunch();
    _listenForConnectivityChanges();
  }

  void _checkInternetOnLaunch() async {
    bool hasInternet = await NetworkService.hasInternetConnection();
    if (!hasInternet) {
      _showNoInternetDialog();
    }
  }

  void _listenForConnectivityChanges() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        _showNoInternetDialog();
      } else {
        if (_isOffline) {
          Navigator.pop(context); // Dismiss the dialog when internet is back
          setState(() => _isOffline = false);
        }
      }
    });
  }

  void _showNoInternetDialog() {
    setState(() => _isOffline = true);

    showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing the dialog
      builder: (BuildContext context) {
        // ignore: deprecated_member_use
        return WillPopScope(
          onWillPop: () async => false, // Prevent back button closing
          child: AlertDialog(
            title: const Text("No Internet Connection"),
            content: const Text("Please check your internet connection and try again."),
            actions: [
              TextButton(
                child: const Text("Retry"),
                onPressed: () async {
                  bool hasInternet = await NetworkService.hasInternetConnection();
                  if (hasInternet) {
                    Navigator.pop(context); // Close dialog if internet is back
                    setState(() => _isOffline = false);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (_isOffline)
          Container(
            color: Colors.black.withOpacity(0.5), // Dark overlay effect
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}
