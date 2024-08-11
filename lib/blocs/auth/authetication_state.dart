part of 'authetication_bloc.dart';

enum ProcesoAuthentication { none, procesando, correcto, error }

// ignore: must_be_immutable
class AuthenticationState extends Equatable {
  List<DataLicencia> dataLicenciasBackend;
  List<DataLicencia> dataLicenciasFrontend;
  List<Historial> dataHistorialBackend;
  List<Historial> dataHistorialFrontend;
  final DataLicencia? dataCorte;
  final Historial? dataHistorial;
  final InfoMetaMask? infoMetaMask;
  final ProcesoAuthentication procesoAuthentication;

  AuthenticationState({
    List<DataLicencia>? dataLicenciasBackend,
    List<DataLicencia>? dataLicenciasFrontend,
    List<Historial>? dataHistorialBackend,
    List<Historial>? dataHistorialFrontend,
    this.dataCorte,
    this.dataHistorial,
    this.infoMetaMask,
    this.procesoAuthentication = ProcesoAuthentication.none,
  })  : dataLicenciasBackend = dataLicenciasBackend ?? [],
        dataLicenciasFrontend = dataLicenciasFrontend ?? [],
        dataHistorialBackend = dataHistorialBackend ?? [],
        dataHistorialFrontend = dataHistorialFrontend ?? [];

  AuthenticationState copyWith({
    List<DataLicencia>? dataLicenciasBackend,
    List<DataLicencia>? dataLicenciasFrontend,
    List<Historial>? dataHistorialBackend,
    List<Historial>? dataHistorialFrontend,
    DataLicencia? dataCorte,
    Historial? dataHistorial,
    InfoMetaMask? infoMetaMask,
    ProcesoAuthentication? procesoAuthentication,
  }) =>
      AuthenticationState(
        dataLicenciasBackend: dataLicenciasBackend ?? this.dataLicenciasBackend,
        dataLicenciasFrontend:
            dataLicenciasFrontend ?? this.dataLicenciasFrontend,
        dataHistorialBackend: dataHistorialBackend ?? this.dataHistorialBackend,
        dataHistorialFrontend:
            dataHistorialFrontend ?? this.dataHistorialFrontend,
        dataCorte: dataCorte ?? this.dataCorte,
        dataHistorial: dataHistorial ?? this.dataHistorial,
        infoMetaMask: infoMetaMask ?? this.infoMetaMask,
        procesoAuthentication:
            procesoAuthentication ?? this.procesoAuthentication,
      );

  @override
  List<Object?> get props => [
        dataLicenciasBackend,
        dataLicenciasFrontend,
        dataHistorialBackend,
        dataHistorialFrontend,
        dataCorte,
        dataHistorial,
        infoMetaMask,
        procesoAuthentication,
      ];
}
