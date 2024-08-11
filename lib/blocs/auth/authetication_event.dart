part of 'authetication_bloc.dart';

class AutheticationEvent extends Equatable {
  const AutheticationEvent();

  @override
  List<Object> get props => [];
}

class OnLoginKEYPrivada extends AutheticationEvent {
  final String keyPrivada;
  final BuildContext context;

  const OnLoginKEYPrivada({required this.keyPrivada, required this.context});
}

class OnChangedDataCorteSelect extends AutheticationEvent {
  final DataLicencia dataCorte;

  const OnChangedDataCorteSelect({
    required this.dataCorte,
  });
}

class OnChangedDataHistorialSelect extends AutheticationEvent {
  final Historial dataHistorial;

  const OnChangedDataHistorialSelect({
    required this.dataHistorial,
  });
}

class OnChangedProccessAuth extends AutheticationEvent {
  final ProcesoAuthentication procesoAuthentication;

  const OnChangedProccessAuth({
    required this.procesoAuthentication,
  });
}

// ignore: must_be_immutable
class OnChangedInfoLicencias extends AutheticationEvent {
  List<DataLicencia>? dataLicenciasBackend;
  List<DataLicencia>? dataLicenciasFrontend;

  OnChangedInfoLicencias({
    this.dataLicenciasBackend,
    this.dataLicenciasFrontend,
  });
}

// ignore: must_be_immutable
class OnChangedInfoHistorial extends AutheticationEvent {
  List<Historial>? dataHistorialBackend;
  List<Historial>? dataHistorialFrontend;

  OnChangedInfoHistorial({
    this.dataHistorialBackend,
    this.dataHistorialFrontend,
  });
}

class OnRemoveInfoHistorial extends AutheticationEvent {
  final Historial dataHistorial;

  const OnRemoveInfoHistorial({
    required this.dataHistorial,
  });
}

class OnEditInfoHistorial extends AutheticationEvent {
  final int index;
  final BuildContext context;

  const OnEditInfoHistorial({
    required this.index,
    required this.context,
  });
}

class OnChangedInfoMetaMask extends AutheticationEvent {
  final InfoMetaMask infoMetaMask;

  const OnChangedInfoMetaMask({
    required this.infoMetaMask,
  });
}
