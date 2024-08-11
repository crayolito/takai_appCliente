import 'package:animate_do/animate_do.dart';
import 'package:app_sig2024/blocs/auth/authetication_bloc.dart';
import 'package:app_sig2024/config/constant/paletaColores.constant.dart';
import 'package:app_sig2024/features/geolocalizacion/presentation/widgets/itemSearchBar.dart';
import 'package:app_sig2024/features/home/domain/entities/licencia.dart';
import 'package:app_sig2024/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SearchLicenciaScreen extends StatelessWidget {
  const SearchLicenciaScreen({super.key});

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
                                .state.dataLicenciasFrontend.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  context.push("/searchHistorial");
                                },
                                child: ItemLicencia(
                                    licencia: autheticationBloc
                                        .state.dataLicenciasFrontend[index],
                                    index: index),
                              );
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
            "LICENCIAS",
            style: estilosText!.titulo4,
          ),
          IconButton(
              onPressed: () {
                showAdaptiveDialog(
                    context: context,
                    builder: (context) {
                      return Container(
                        margin: EdgeInsets.only(
                          top: size.height * 0.52,
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
                              const DatosMetaMask(),
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

class ButtonsFiltroRutaCorte extends StatelessWidget {
  const ButtonsFiltroRutaCorte({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final autheticationBloc = BlocProvider.of<AutheticationBloc>(context);
    return Container(
      color: Colors.red,
      height: size.height * 0.07,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(kPrimaryColor),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            onPressed: () {},
            child: Text("Licencias", style: estilosText!.subTitulo2FiltroRuta),
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(kPrimaryColor),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            onPressed: () {
              // context.pop();
              // ShowLoadingCustom.showLoadingProcesoRutas(context);
              // autheticationBloc.add(const OnUpdatePuntosCorte());
            },
            child: Text("Historial", style: estilosText!.subTitulo2FiltroRuta),
          )
        ],
      ),
    );
  }
}

class DatosMetaMask extends StatelessWidget {
  const DatosMetaMask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final autheticationBloc =
        BlocProvider.of<AutheticationBloc>(context, listen: true);

    final addressPublica =
        autheticationBloc.state.infoMetaMask?.addressPublica ??
            "0xE9938d3E3960D3DAcb2Baaf2aFE2333D78d85Dee";
    final addressPrivada = autheticationBloc
            .state.infoMetaMask?.addressPrivada ??
        "0xa305f66de4bd76959ad7f989a7d8b7dcb00306aac65576d94e84b5bbfba5de15";
    final bs = autheticationBloc.state.infoMetaMask?.cantidadBS ?? 0.00;
    final usd = autheticationBloc.state.infoMetaMask?.cantidadUSB ?? 0.00;
    final eth = autheticationBloc.state.infoMetaMask?.cantidadETH ?? 0.00;

    return SizedBox(
      height: size.height * 0.35,
      width: size.width,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Clave Publica", style: estilosText!.titulo2FiltroRuta),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                FontAwesomeIcons.key,
                color: kPrimaryColor,
                size: size.width * 0.07,
              ),
              SizedBox(
                width: size.width * 0.83,
                child: Text(
                  addressPublica,
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
            child: Text("Clave Privada", style: estilosText!.titulo2FiltroRuta),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.security,
                color: kPrimaryColor,
                size: size.width * 0.07,
              ),
              SizedBox(
                width: size.width * 0.83,
                child: Text(
                  addressPrivada,
                  style: estilosText!.subTituloFiltroRuta,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                FontAwesomeIcons.moneyBill,
                color: kPrimaryColor,
                size: size.width * 0.07,
              ),
              SizedBox(
                width: size.width * 0.83,
                child: Text(
                  "$bs BS",
                  style: estilosText!.subTituloFiltroRuta,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                FontAwesomeIcons.dollarSign,
                color: kPrimaryColor,
                size: size.width * 0.07,
              ),
              SizedBox(
                width: size.width * 0.83,
                child: Text(
                  "$usd USB",
                  style: estilosText!.subTituloFiltroRuta,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                FontAwesomeIcons.ethereum,
                color: kPrimaryColor,
                size: size.width * 0.07,
              ),
              SizedBox(
                width: size.width * 0.83,
                child: Text(
                  "$eth ETH",
                  style: estilosText!.subTituloFiltroRuta,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
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
            "Datos Cuenta",
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

class ItemLicencia extends StatelessWidget {
  const ItemLicencia({
    super.key,
    required this.licencia,
    required this.index,
  });

  final int index;
  final DataLicencia licencia;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FadeInLeft(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.01,
        ),
        height: size.height * 0.11,
        width: size.width,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: kPrimaryColor.withOpacity(0.5),
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                // googleMapBloc.add(OnRoutesXaY(
                //     LatLng(licencia.latitud, licencia.longitud)));
                // context.pop();
                context.push("historial");
              },
              child: Icon(
                Icons.list_alt_rounded,
                size: size.width * 0.08,
                color: kPrimaryColor,
              ),
            ),
            SizedBox(
              width: size.width * 0.024,
            ),
            Container(
              height: size.height * 0.09,
              width: size.width * 0.82,
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nro : ${licencia.nroLicencia}",
                    textAlign: TextAlign.start,
                    style: estilosText!.tituloItemPC,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "${licencia.fechaEmision} - C.I. ${licencia.carnetIdentidad}",
                    textAlign: TextAlign.start,
                    style: estilosText!.subTituloItemPC,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
