import 'package:rxdart/rxdart.dart';
import 'package:flutter/foundation.dart';

class BaseBloc extends ChangeNotifier {
  final _isLoadingSubject = BehaviorSubject<bool>.seeded(false);

  Stream<bool> get loadingStatus => _isLoadingSubject.stream;

  void setBusy(){
    _isLoadingSubject.sink.add(true);
  }

  void setIdle(){
    _isLoadingSubject.sink.add(false);
  }

  void setError(String message){
    _isLoadingSubject.sink.addError(message);
  }

  @override
  void dispose() {
    _isLoadingSubject.close();
    super.dispose();
  }
}