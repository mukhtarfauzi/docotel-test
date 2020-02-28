import 'package:docotel_test/bloc/base_bloc.dart';
import 'package:docotel_test/models/registration_req.dart';
import 'package:docotel_test/services/database_service.dart';
import 'package:rxdart/rxdart.dart';

class RegistrationBloc extends BaseBloc {
  final database = DatabaseService();

  final _fullNameSubject = BehaviorSubject<String>();

  Function(String) get fullNameSink => _fullNameSubject.sink.add;

  Stream<String> get fullNameStream => _fullNameSubject.stream;

  final _usernameSubject = BehaviorSubject<String>();

  Function(String) get usernameSink => _usernameSubject.sink.add;

  Stream<String> get usernameStream => _usernameSubject.stream;

  final _passwordSubject = BehaviorSubject<String>();

  Function(String) get passwordSink => _passwordSubject.sink.add;

  Stream<String> get passwordStream => _passwordSubject.stream;

  final _passwordConfirmSubject = BehaviorSubject<String>();

  Stream<String> get passwordConfirmStream => _passwordConfirmSubject.stream;

  Function(String) get passwordConfirmSink => _passwordConfirmSubject.sink.add;

  bool _isSecurePassword;

  bool _isSecurePasswordConfirmation;


  bool get isSecurePassword => _isSecurePassword;

  set isSecurePassword(bool value) {
    _isSecurePassword = value;
    notifyListeners();
  }

  bool get isSecurePasswordConfirmation => _isSecurePasswordConfirmation;

  set isSecurePasswordConfirmation(bool value) {
    _isSecurePasswordConfirmation = value;
    notifyListeners();
  }

  Future<bool> register() async{
    var result = await database.saveUser(RegistrationReq(
      fullName: _fullNameSubject.value,
      username: _usernameSubject.value,
      password: _passwordSubject.value,
    ));

    if(result == 1){
      return true;
    }else{
      return false;
    }
  }

  @override
  void dispose() {
    _fullNameSubject.close();
    _usernameSubject.close();
    _passwordSubject.close();
    _passwordConfirmSubject.close();
    super.dispose();
  }
}
