import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:app_sig2024/blocs/auth/authetication_bloc.dart';
import 'package:app_sig2024/config/constant/paletaColores.constant.dart';
import 'package:app_sig2024/features/geolocalizacion/presentation/widgets/itemSearchBar.dart';
import 'package:app_sig2024/features/home/domain/entities/historial.dart';
import 'package:app_sig2024/features/home/domain/entities/licencia.dart';
import 'package:app_sig2024/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SearchHistorialScreen extends StatelessWidget {
  const SearchHistorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final autheticationBloc =
        BlocProvider.of<AutheticationBloc>(context, listen: true);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          child: Stack(
            children: [
              SizedBox(
                width: size.width,
                height: size.height,
                child: Column(
                  children: [
                    // NOTE: Navbar de la pantalla de busqueda
                    const NavbarCustom(),
                    Container(
                        margin: EdgeInsets.only(top: size.height * 0.01),
                        padding: EdgeInsets.only(
                            left: size.width * 0.015,
                            right: size.width * 0.015,
                            bottom: size.height * 0.005),
                        height: size.height * 0.83,
                        width: size.width,
                        child: ListView.builder(
                            itemCount: autheticationBloc
                                .state.dataHistorialFrontend.length,
                            itemBuilder: (context, index) {
                              return ItemInspeccion(
                                  historial: autheticationBloc
                                      .state.dataHistorialFrontend[index],
                                  index: index);
                            })),
                  ],
                ),
              ),
              //  NOTE: Filtrado de los items de la lista de puntos de corte
              const SearchBarComponent(),
            ],
          ),
        ),
      ),
    );
  }
}

class NavbarCustom extends StatefulWidget {
  const NavbarCustom({
    super.key,
  });

  @override
  State<NavbarCustom> createState() => _NavbarCustomState();
}

class _NavbarCustomState extends State<NavbarCustom> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.015,
      ),
      width: size.width,
      height: size.height * 0.16,
      color: kPrimaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: kTerciaryColor,
              size: size.width * 0.08,
            ),
            onPressed: () {
              context.pop();
            },
          ),
          Text(
            "HISTORIAL",
            style: estilosText!.titulo4,
          ),
          IconButton(
              onPressed: () {
                showAdaptiveDialog(
                    context: context,
                    builder: (context) {
                      return Container(
                        margin: EdgeInsets.only(
                          top: size.height * 0.1,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.02,
                          vertical: size.height * 0.01,
                        ),
                        width: size.width,
                        height: size.height * 0.5,
                        color: Colors.white,
                        child: Material(
                          child: Column(
                            children: [
                              // READ : TITULO DEL WIDGETS
                              const TitleFiltro(),
                              SizedBox(
                                height: size.height * 0.015,
                              ),
                              // READ : Datos de la cuenta
                              const DatosLicencia(),
                            ],
                          ),
                        ),
                      );
                    });
              },
              icon: Icon(
                FontAwesomeIcons.sliders,
                color: kTerciaryColor,
                size: size.width * 0.08,
              ))
        ],
      ),
    );
  }
}

class DatosLicencia extends StatelessWidget {
  const DatosLicencia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final autheticationBloc =
    //     BlocProvider.of<AutheticationBloc>(context, listen: true);
    Random random = Random();
    int randomIndex = random.nextInt(listaLicencias.length);

    DataLicencia licenciaAleatoria = listaLicencias[randomIndex];

    return Container(
      color: Colors.transparent,
      height: size.height * 0.77,
      width: size.width,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Propietario", style: estilosText!.titulo2FiltroRuta),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                FontAwesomeIcons.person,
                color: kPrimaryColor,
                size: size.width * 0.07,
              ),
              SizedBox(
                width: size.width * 0.83,
                child: Text(
                  licenciaAleatoria.propietario,
                  style: estilosText!.subTituloFiltroRuta,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child:
                Text("Carnet Identidad", style: estilosText!.titulo2FiltroRuta),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.credit_card,
                color: kPrimaryColor,
                size: size.width * 0.07,
              ),
              SizedBox(
                width: size.width * 0.83,
                child: Text(
                  "${licenciaAleatoria.carnetIdentidad} LPZ",
                  style: estilosText!.subTituloFiltroRuta,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Nro. Licencia", style: estilosText!.titulo2FiltroRuta),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.credit_card,
                color: kPrimaryColor,
                size: size.width * 0.07,
              ),
              SizedBox(
                width: size.width * 0.83,
                child: Text(
                  licenciaAleatoria.nroLicencia,
                  style: estilosText!.subTituloFiltroRuta,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Fecha Emision", style: estilosText!.titulo2FiltroRuta),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.calendar_today,
                color: kPrimaryColor,
                size: size.width * 0.07,
              ),
              SizedBox(
                width: size.width * 0.83,
                child: Text(
                  licenciaAleatoria.fechaEmision,
                  style: estilosText!.subTituloFiltroRuta,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          Center(
            child: SizedBox(
              width: size.width * 0.6,
              height: size.height * 0.37,
              child: Image.network(
                licenciaAleatoria.imagen, // Ruta de tu imagen
                fit: BoxFit.cover, // Ajusta la imagen al tamaño del contenedor
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TitleFiltro extends StatelessWidget {
  const TitleFiltro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.center,
      height: size.height * 0.05,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Datos Licencia",
            style: estilosText!.tituloTipoMapa,
          ),
          IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(
                FontAwesomeIcons.xmark,
                color: kPrimaryColor,
                size: size.width * 0.08,
              ))
        ],
      ),
    );
  }
}

class ItemInspeccion extends StatelessWidget {
  const ItemInspeccion({
    super.key,
    required this.historial,
    required this.index,
  });

  final int index;
  final Historial historial;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final autheticationBloc =
        BlocProvider.of<AutheticationBloc>(context, listen: true);

    return FadeInLeft(
      child: Container(
        // alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.01,
        ),
        margin: EdgeInsets.symmetric(
          vertical: size.height * 0.01,
          horizontal: size.width * 0.01,
        ),
        // height: size.height * 0.23,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // height: size.height * 0.14,
              width: size.width * 0.82,
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Licencia ${historial.tipoLicencia}",
                      textAlign: TextAlign.center,
                      style: estilosText!.tituloItemPC,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.12,
                        height: size.height * 0.05,
                        child: Icon(
                          Icons.read_more,
                          size: size.width * 0.1,
                          color: kPrimaryColor,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Text(
                        historial.estado,
                        textAlign: TextAlign.start,
                        style: estilosText!.subTituloItemPC,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.12,
                        height: size.height * 0.05,
                        child: Icon(
                          Icons.security_sharp,
                          size: size.width * 0.08,
                          color: kPrimaryColor,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Text(
                        historial.inspector,
                        textAlign: TextAlign.start,
                        style: estilosText!.subTituloItemPC,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.12,
                        height: size.height * 0.05,
                        child: Icon(
                          Icons.date_range,
                          size: size.width * 0.08,
                          color: kPrimaryColor,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Text(
                        historial.fechaInspeccion,
                        textAlign: TextAlign.start,
                        style: estilosText!.subTituloItemPC,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  historial.estadoInspeccion
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.cancel,
                                color: Colors.red,
                                size: size.width * 0.09,
                              ),
                              onPressed: () {
                                autheticationBloc.add(OnRemoveInfoHistorial(
                                    dataHistorial: historial));
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.check,
                                color: Colors.blue,
                                size: size.width * 0.09,
                              ),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      final size = MediaQuery.of(context).size;
                                      final autheticationBloc =
                                          BlocProvider.of<AutheticationBloc>(
                                              context,
                                              listen: true);

                                      return AlertDialog(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            side: const BorderSide(
                                                color: kPrimaryColor,
                                                width: 3)),
                                        title: Text(
                                          "Total Balance",
                                          textAlign: TextAlign.center,
                                          style: estilosText!.titulo2,
                                        ),
                                        content: SizedBox(
                                          height: size.height * 0.67,
                                          width: size.width * 0.8,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: size.width * 0.7,
                                                height: size.height * 0.2,
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Bolivianos",
                                                      style:
                                                          estilosText!.titulo2,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "-417.6",
                                                          style: estilosText!
                                                              .subTituloItemPC,
                                                        ),
                                                        Text(
                                                          "Bs.",
                                                          style: estilosText!
                                                              .subTituloItemPC,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "51843.09556",
                                                          style: estilosText!
                                                              .subTituloItemPC,
                                                        ),
                                                        Text(
                                                          "Bs.",
                                                          style: estilosText!
                                                              .subTituloItemPC,
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      width: size.width * 0.7,
                                                      height:
                                                          size.height * 0.002,
                                                      color: kPrimaryColor,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "51425.49556",
                                                          style: estilosText!
                                                              .subTituloItemPC,
                                                        ),
                                                        Text(
                                                          "Bs.",
                                                          style: estilosText!
                                                              .subTituloItemPC,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.7,
                                                height: size.height * 0.2,
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Dolares",
                                                      style:
                                                          estilosText!.titulo2,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "-60",
                                                          style: estilosText!
                                                              .subTituloItemPC,
                                                        ),
                                                        Text(
                                                          "USD.",
                                                          style: estilosText!
                                                              .subTituloItemPC,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "6480.3869",
                                                          style: estilosText!
                                                              .subTituloItemPC,
                                                        ),
                                                        Text(
                                                          "USD.",
                                                          style: estilosText!
                                                              .subTituloItemPC,
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      width: size.width * 0.7,
                                                      height:
                                                          size.height * 0.002,
                                                      color: kPrimaryColor,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "6420.3869",
                                                          style: estilosText!
                                                              .subTituloItemPC,
                                                        ),
                                                        Text(
                                                          "USD.",
                                                          style: estilosText!
                                                              .subTituloItemPC,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.7,
                                                height: size.height * 0.2,
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Etherium",
                                                      style:
                                                          estilosText!.titulo2,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "-0.03",
                                                          style: estilosText!
                                                              .subTituloItemPC,
                                                        ),
                                                        Text(
                                                          "ETH.",
                                                          style: estilosText!
                                                              .subTituloItemPC,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "2.160112",
                                                          style: estilosText!
                                                              .subTituloItemPC,
                                                        ),
                                                        Text(
                                                          "ETH.",
                                                          style: estilosText!
                                                              .subTituloItemPC,
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      width: size.width * 0.7,
                                                      height:
                                                          size.height * 0.002,
                                                      color: kPrimaryColor,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "2.130112",
                                                          style: estilosText!
                                                              .subTituloItemPC,
                                                        ),
                                                        Text(
                                                          "ETH.",
                                                          style: estilosText!
                                                              .subTituloItemPC,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  IconButton(
                                                    icon: Icon(
                                                      FontAwesomeIcons.check,
                                                      color: Colors.green,
                                                      size: size.width * 0.09,
                                                    ),
                                                    onPressed: () {
                                                      autheticationBloc.add(
                                                          OnEditInfoHistorial(
                                                              index: index, context: context));
                                                    },
                                                  ),
                                                  IconButton(
                                                    icon: Icon(
                                                      FontAwesomeIcons.times,
                                                      color: Colors.red,
                                                      size: size.width * 0.09,
                                                    ),
                                                    onPressed: () {
                                                      context.pop();
                                                    },
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                            ),
                          ],
                        )
                      : Container()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
