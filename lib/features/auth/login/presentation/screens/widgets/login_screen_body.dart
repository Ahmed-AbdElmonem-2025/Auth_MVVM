 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/shared/app_colors.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../core/widgets/toast_message_widget.dart';
import '../../../cubit/Auth_cubit.dart';
import '../../../cubit/auth_states.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AuthCubit>(context, listen: true);
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          showSnackBarItem(state.errorMsg, context, false);
          print('errrrrrrrrrrrrrrrrrrrrrrrror');
        }
        if (state is LoginSuccessState) {
          showSnackBarItem('Login Success', context, true);
          /* Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) {
               return   
             },));*/
          print('suuuuuuuuuuuuuuuuuuuuuucscccccccssssssss');
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset(
                    'assets/images/backgroundt.png',
                    width: double.infinity,
                  ),
                  Center(
                      child: Text(
                    'Welcome Back',
                    style: TextStyle(color: AppColors.white, fontSize: 20),
                  )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Form(
                  key: cubit.loginkey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: cubit.emailController,
                        hintText: 'Email',
                        validator: (data) {
                          if (data!.isEmpty) {
                            return 'email not valid';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: cubit.passwordController,
                        hintText: 'password',
                        validator: (data) {
                          if (data!.length < 6) {
                            return 'password not valid';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          InkWell(
                              onTap: () {},
                              child: const Text(
                                'forget password',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        width: double.infinity,
                        color: AppColors.primaryColor,
                        child: IconButton(
                          onPressed: () {
                            if (cubit.loginkey.currentState!.validate()) {
                              cubit.login();
                            }
                          },
                          icon: state is LoginLoadingState
                              ? CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                )
                              : Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
