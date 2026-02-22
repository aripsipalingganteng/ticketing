import 'package:dartz/dartz.dart';
import 'package:ticketing_apps/core/constants/variabels.dart';
import 'package:ticketing_apps/data/local_datasource/auth_local_datasource.dart';
import 'package:ticketing_apps/models/responses/product_response_model.dart';
import 'package:http/http.dart' as http;

class ProductRemoteDatasource {
  Future<Either<String, ProductResponseModel>> getProduct() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      Uri.parse('${Variabels.baseurl}/api/api-products'),
      headers: {
        'Content-Type': "application/json",
        'Authorization': 'Bearer ${authData.token}',
      },
    );

    if (response.statusCode == 200) {
      return Right(ProductResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }
}