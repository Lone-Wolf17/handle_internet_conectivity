import 'package:handle_internet_conectivity/services/api_service.dart';
import 'package:handle_internet_conectivity/services/connectivity_service.dart';
import 'package:handle_internet_conectivity/ui/views/home_view/home_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: HomeView, initial: true)
  ],
  dependencies: [
    Singleton(classType: SnackbarService),
    Singleton(classType: ConnectivityService),
    LazySingleton(classType: ApiService)
  ],
  logger: StackedLogger()
)
class AppSetUp {}