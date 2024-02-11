import 'dart:async';

import 'package:stacked/stacked.dart';

import '../../api/api_service.dart';
import '../../model/login_response.dart';
import '../../utils/get_it.dart';
import '../../utils/pref_utils.dart';

class AuthViewModel extends BaseViewModel {
  final api = getIt.get<ApiService>();
  StreamController<String> _errorStream = StreamController();

  Stream<String> get errorData {
    return _errorStream.stream;
  }

  StreamController<LoginResponse> _loginConfirmStream = StreamController();

  Stream<LoginResponse> get loginConfirmData {
    return _loginConfirmStream.stream;
  }

  var progressData = false;

  void login(String login, String password, ) async {
    progressData = true;
    notifyListeners();
    final data = await api.login(login, password,  _errorStream);
    if (data != null) {
      await PrefUtils.setToken(data.token);
      // PrefUtils.setUser(LoginResponse(data.id, data.username, data.token, data.sklad_id, storeName));
      apiServiceProvider();
      _loginConfirmStream.sink.add(data);
    }
    progressData = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _errorStream.close();
    super.dispose();
  }
}
