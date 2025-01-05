import 'package:auth_mvvm/core/api/dio_helper.dart';
import 'package:auth_mvvm/core/api/end_point.dart';
import 'package:auth_mvvm/features/auth/login/data/models/login_model.dart';
import 'package:auth_mvvm/features/auth/login/data/repositories/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
    final  DioHelper diohelper;
    LoginRepoImpl(  this.diohelper );
  @override
  Future  login({required email, required password})async {

    try {
      var data =await diohelper.post(endPoint: EndPoint.loginEndpoint,data: {
      'email':email,
      'password':password,
      
     },
      
     );
     return  LoginModel.fromJson(data);
    } catch (e) {
        return  e.toString();
    }
    
  }
  
  
}