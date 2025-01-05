 
 
import 'package:auth_mvvm/core/api/dio_helper.dart';
import 'package:auth_mvvm/features/auth/login/data/repositories/login_repo_impl.dart';
import 'package:auth_mvvm/features/auth/login/presentation/screens/widgets/login_screen_body.dart';
 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/Auth_cubit.dart';
  
 

class SignInScreen extends StatelessWidget {
    const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) {
        return AuthCubit(LoginRepoImpl(DioHelper()));
      },
      child: Scaffold(
          body: LoginScreenBody(),
      
  ));
        
  
  }
 
}