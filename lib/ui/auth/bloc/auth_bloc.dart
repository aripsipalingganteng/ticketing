import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ticketing_apps/data/remote_datasource/auth_remote_datasource.dart';
import 'package:ticketing_apps/models/requests/login_request_model.dart';
import 'package:ticketing_apps/models/responses/login_response_model.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRemoteDatasource authRemoteDatasource;
  AuthBloc(this.authRemoteDatasource) : super(_Initial()) {
    on<_Login>((event, emit) async {
      emit(_Loading());
      final dataRequest = LoginRequestModel(
        email: event.email,
        password: event.password,
      );

      final response = await authRemoteDatasource.login(dataRequest);

      response.fold(
        (error) => emit(_Error(error)),
        (data) => emit(_Success(data)),
      );
    });

    on<_Logout>((event, emit) async {
      emit(_Loading());

      final response = await authRemoteDatasource.logout();

      response.fold(
        (error) => emit(_Error(error)),
        (data) => emit(_SuccessLogout()),
      );
    });
  }
}