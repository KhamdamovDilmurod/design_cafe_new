import 'package:event_bus/event_bus.dart';
import 'package:get_it/get_it.dart';

import '../api/api_service.dart';

// final eventBus= EventBus();
final getIt = GetIt.instance;

final eventBus = EventBus();

// eventBusProvider() {
//   getIt.registerSingleton<EventBus>(EventBus(sync: true));
// }

apiServiceProvider(){
  if (getIt.isRegistered<ApiService>() == true) {
  getIt.unregister<ApiService>();
  }
  getIt.registerSingleton<ApiService>(ApiService());
}
