import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:medicinepro/connectivity/connectivity_widget.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  bool _isDialogShowing = false;

  void initialize(BuildContext context) {
    _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        if (!_isDialogShowing) {
          _isDialogShowing = true;
          showNoConnectionDialog(context);
        }
      } else {
        if (_isDialogShowing) {
          Navigator.of(context, rootNavigator: true).pop();
          _isDialogShowing = false;
        }
      }
    });

    _checkConnectionOnStartup(context);
  }

  Future<void> _checkConnectionOnStartup(BuildContext context) async {
    final result = await _connectivity.checkConnectivity();
    if (result == ConnectivityResult.none) {
      _isDialogShowing = true;
      showNoConnectionDialog(context);
    }
  }
}
