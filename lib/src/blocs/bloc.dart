import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validator{

  //final _email = StreamController<String>();
  //final _password = StreamController<String>();  
  
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Stream<String> get email => _email.stream.transform(emailValidator);
  Stream<String> get password => _password.stream.transform(passwordValidator);

  Stream<bool> get bothValidated => Rx.combineLatest2(email, password, (e, p) => true);

  submit(){
    final email = _email.value;
    final password = _password.value;

    print("The email is $email");
    print("The pssword is $password");
  }

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  dispose(){
    _email.close();
    _password.close();
  }
}

final bloc = Bloc();