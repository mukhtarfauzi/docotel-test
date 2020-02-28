import 'package:docotel_test/bloc/registration_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class RegistrationScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<RegistrationBloc>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Registration Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                onChanged: bloc.fullNameSink,
                decoration: InputDecoration(
                  labelText: 'Fullname',
                ),
              ),
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
                  suffixIcon: IconButton(icon: Icon(Icons.visibility), onPressed: null)
                ),
              ),
              TextField(
                onChanged: bloc.passwordConfirmSink,
                decoration: InputDecoration(
                  labelText: 'Re-Password',
                  suffixIcon: IconButton(icon: Icon(Icons.visibility), onPressed: null)
                ),
              ),
              RaisedButton(
                child: Text('Submit'),
                onPressed: () async{
                  var result = await bloc.register();
                  if(result){
                    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Success')));
                  }else{
                    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Failed')));

                  }
                },
              )
            ],
          ),
        ),
      ),
      
    );
  }
}
