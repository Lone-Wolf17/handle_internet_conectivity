import 'dart:io';

import 'package:handle_internet_conectivity/app/app.locator.dart';
import 'package:handle_internet_conectivity/app/app.logger.dart';
import 'package:handle_internet_conectivity/services/connectivity_service.dart';
import 'package:handle_internet_conectivity/utils/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends StreamViewModel {
  final _connectivityService = locator<ConnectivityService>();
  final _snackbarService = locator<SnackbarService>();
  final log = getLogger('HomeViewModel');

  bool connectionStatus = false;
  bool hasCalled = false;
  bool hasShownSnackbar = false;

  Stream<bool> checkConnectivity() async* {
    yield await _connectivityService.checkInternetConnection();
  }

  setUp() {

  }

  @override
  // TODO: implement stream
  Stream get stream => checkConnectivity();

  bool get status {
    stream.listen((event) {
      connectionStatus = event;
      notifyListeners();

      if (hasCalled == false) getCharacters();
    });
    return connectionStatus;
  }

  Future<void> getCharacters() async {
    if (connectionStatus == true) {
      try {
        await runBusyFuture(
            Future.delayed(const Duration(seconds: 3)), throwException: true);
        hasCalled = true;
        notifyListeners();
      } on SocketException catch (e) {
        hasCalled = true;
        notifyListeners();
        _snackbarService.showCustomSnackBar(
            message: e.toString(), variant: SnackBarType.negative);
      } on Exception catch (e) {
        hasCalled = true;
        notifyListeners();
        _snackbarService.showCustomSnackBar(
            message: e.toString(), variant: SnackBarType.negative);
      }
      } else {
      log.e('Internet Connectivity Error');
      if (hasShownSnackbar == false) {
        _snackbarService.showCustomSnackBar(
            message: 'Error: Internet Connection is weak or disconnected',
            duration: const Duration(seconds: 5),
            variant: SnackBarType.negative);
        hasShownSnackbar = true;
        notifyListeners();
      }
    }
  }}
