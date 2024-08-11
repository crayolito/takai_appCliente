import 'package:app_sig2024/features/home/domain/entities/historial.dart';
import 'package:app_sig2024/features/home/domain/entities/licencia.dart';
import 'package:app_sig2024/features/home/domain/entities/metaMask.dart';
import 'package:app_sig2024/features/home/infrastructure/repositories/geo_repository_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'authetication_event.dart';
part 'authetication_state.dart';

class AutheticationBloc extends Bloc<AutheticationEvent, AuthenticationState> {
  final homeRepositoryImpl = HomeRepositoryImpl();

  AutheticationBloc() : super(AuthenticationState()) {
    on<OnLoginKEYPrivada>((event, emit) async {
      InfoMetaMask infoMetaMask = await homeRepositoryImpl.getInfoMetaMask(
          "a305f66de4bd76959ad7f989a7d8b7dcb00306aac65576d94e84b5bbfba5de15");

      emit(state.copyWith(infoMetaMask: infoMetaMask));
      event.context.push("/searchLicencia");
    });

    on<OnChangedInfoLicencias>((event, emit) async {
      List<DataLicencia> licencias = [...listaLicencias];
      emit(state.copyWith(
        dataLicenciasBackend: licencias,
        dataLicenciasFrontend: licencias,
      ));

      // READ : HACER CON EL ABI JSON BLOCKCHAIN
      // List<DataLicencia> licenciasBlockChain = await homeRepositoryImpl.getDataLicencias();
      // licenciasBlockChain = [...listaLicencias];
      // emit(state.copyWith(
      //   dataLicenciasBackend:
      //       event.dataLicenciasBackend ?? state.dataLicenciasBackend,
      //   dataLicenciasFrontend:
      //       event.dataLicenciasFrontend ?? state.dataLicenciasFrontend,
      // ));
    });

    on<OnChangedInfoHistorial>((event, emit) {
      List<Historial> historiasLicencias = [...historialList];
      emit(state.copyWith(
        dataHistorialBackend: historiasLicencias,
        dataHistorialFrontend: historiasLicencias,
      ));

      on<OnRemoveInfoHistorial>((event, emit) {
        final historiasLicencias = state.dataHistorialFrontend
            .where((element) => element.id != event.dataHistorial.id)
            .toList();
        emit(state.copyWith(dataHistorialFrontend: historiasLicencias));
      });

      on<OnEditInfoHistorial>((event, emit) {
        List<Historial> historiasLicencias = [...state.dataHistorialFrontend];

        // Función para modificar un elemento específico en la lista usando el índice
        void modificarElementoHistorial(int index) {
          if (index >= 0 && index < historiasLicencias.length) {
            // Aquí puedes modificar los campos específicos del objeto Historial
            historiasLicencias[index].estadoInspeccion =
                !historiasLicencias[index].estadoInspeccion;
            // Agrega más modificaciones según sea necesario
          }
        }

        // Modificar el elemento con el índice proporcionado en el evento
        modificarElementoHistorial(event.index);

        emit(state.copyWith(
          dataHistorialBackend: historiasLicencias,
          dataHistorialFrontend: historiasLicencias,
        ));
        event.context.pop();
      });

      // READ : HACER CON EL ABI JSON BLOCKCHAIN
      // List<Historial> historiasLicenciasBlockChain = await homeRepositoryImpl.getDataHistorial();
      // historiasLicenciasBlockChain = [...listaHistorial];
      // emit(state.copyWith(
      //   dataHistorialBackend: event.dataHistorialBackend ?? state.dataHistorialBackend,
      //   dataHistorialFrontend: event.dataHistorialFrontend ?? state.dataHistorialFrontend,
      // ));
    });
  }
}
