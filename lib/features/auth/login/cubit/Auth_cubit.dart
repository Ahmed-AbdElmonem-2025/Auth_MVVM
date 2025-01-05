// ignore_for_file: file_names
 
import 'package:auth_mvvm/features/auth/login/data/repositories/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
 
 
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit (this.loginRepo) : super(InitialState());

  LoginRepo loginRepo;
  TextEditingController emailController = TextEditingController();

   TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginkey = GlobalKey<FormState>();
 Future<void> login( 
    
  )async{
  emit(LoginLoadingState());  
  
     var result = await  loginRepo.login(email: emailController.text, password: passwordController.text);
    if (result is  String) {
      emit(LoginErrorState(result.toString()));
    } else {
      emit(LoginSuccessState());
    }
     
    
 
  }

  



 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
   












 
 
}