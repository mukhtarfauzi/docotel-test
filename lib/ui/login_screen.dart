import 'package:docotel_test/bloc/login_bloc.dart';
import 'package:docotel_test/bloc/registration_bloc.dart';
import 'package:docotel_test/ui/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<LoginBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                onChanged: bloc.usernameSink,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
              TextField(
                onChanged: bloc.passwordSink,
                decoration: InputDecoration(
                    labelText: 'Passowrd',
                    suffixIcon: IconButton(
                        icon: Icon(Icons.visibility), onPressed: null)),
              ),
              RaisedButton(
                child: Text('Login'),
                onPressed: (){
                },
              ),
              FlatButton(
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider(
                            create: (_) => RegistrationBloc(),
                            child: RegistrationScreen(),
                          ),
                        ),
                      ),
                  child: Text('Register here!'))
            ],
          ),
        ),
      ),
    );
  }
}
