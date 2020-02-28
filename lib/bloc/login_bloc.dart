import 'package:docotel_test/bloc/base_bloc.dart';
import 'package:docotel_test/models/login_req.dart';
import 'package:docotel_test/services/database_service.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BaseBloc {
  final database = DatabaseService();

  final _usernameSubject = BehaviorSubject<String>();

  Function(String) get usernameSink => _usernameSubject.sink.add;

  Stream<String> get usernameStream => _usernameSubject.stream;

  final _passwordSubject = BehaviorSubject<String>();

  Function(String) get passwordSink => _passwordSubject.sink.add;

  Stream<String> get passwordStream => _passwordSubject.stream;

  bool _isSecurePassword;

  bool get isSecurePassword => _isSecurePassword;

  set isSecurePassword(bool value) {
    _isSecurePassword = value;
    notifyListeners();
  }

  Future<LoginReq> login(){
    var result = database.getLogin(_usernameSubject.value, _passwordSubject.value);
    if(result != null){
      return result;
    }
    return null;
  }

  @override
  void dispose() {
    _usernameSubject.close();
    _passwordSubject.close();
    super.dispose();
  }
}