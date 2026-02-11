
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:ticketing/core/constants/variabels.dart';
import 'package:ticketing/models/responses/login_responses_model.dart';

class AuthRemoteDatasource {

  Future< Either<String, LoginResponseModel>> login(LoginResponseModel data) async {
    final response = await http.post(Uri.parse('${Variabels.baseurl}/api/login'),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    body: data.toJson()
    );

    if (response.statusCode == 200) {
      return right(LoginResponseModel.fromJson(response.body));
    } else {
      return left(response.body);
    }
  }
}