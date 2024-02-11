
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

import '../model/chef/order_food_model.dart';
import '../model/event_model.dart';
import '../utils/constants.dart';
import '../utils/get_it.dart';
import '../utils/pref_utils.dart';
import 'notification_service.dart';

class SocketService {
  static IO.Socket? client = null;

  static void initSocket() {
    client = IO.io(
        BASE_URL_SOCKET,
        OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .setTimeout(20000)
            .setQuery({'token': PrefUtils.getToken()}) // optional
            .build());

    client?.onConnect((data) {
      print("JW Socket connected! $data");
    });

    client?.onDisconnect((data) {
      print("JW Socket Disconnect! $data");
    });

    client?.onError((data) {
      print("JW Socket Error! $data");
    });

    client?.onConnectError((data) {
      print("JW Socket Connect  Error! $data");
    });

    client?.on("newOrder", (data) {
      print("JW newOrder $data");
      eventBus.fire(EventModel(event: EVENT_UPDATE_ORDERS, data: "data"));
      // NotificationService.showNotification("New Order", "You have a new order!");
    });

    client?.disconnect().connect();
  }

  static Socket getInstance() {
    if (client == null) {
      initSocket();
    }
    return client!;
  }

  static Socket getDisconnect() {
    return client!.close();
  }
}
