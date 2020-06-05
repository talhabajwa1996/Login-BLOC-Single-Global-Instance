import 'dart:async';

class Validator{
  final emailValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (email, sink){
      if(email.contains('@')){
        sink.add(email);
      }
      else{
        sink.addError('Invalid Email');
      }
      },
  );

  final passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if(password.length > 4){
        sink.add(password);
      }
      else{
        sink.addError('Invalid Password');
      }
    },
  );
}