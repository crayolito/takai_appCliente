class DataLicencia {
  String propietario;
  String carnetIdentidad;
  String nroLicencia;
  String imagen;
  String fechaEmision;

  DataLicencia({
    required this.propietario,
    required this.carnetIdentidad,
    required this.nroLicencia,
    required this.imagen,
    required this.fechaEmision,
  });
}

List<DataLicencia> listaLicencias = [
  DataLicencia(
    propietario: 'Gabriela Fernández',
    carnetIdentidad: '33445566',
    nroLicencia: 'LIC006',
    imagen:
        'https://res.cloudinary.com/da9xsfose/image/upload/v1723271282/cvkkvhgxqjfkhzaqd60o.jpg',
    fechaEmision: '2024/06/10',
  ),
  DataLicencia(
    propietario: 'Miguel Ortiz',
    carnetIdentidad: '77889900',
    nroLicencia: 'LIC007',
    imagen:
        'https://res.cloudinary.com/da9xsfose/image/upload/v1723300654/vxdpryjennf96pqygdce.jpg',
    fechaEmision: '2024/07/15',
  ),
  DataLicencia(
    propietario: 'Laura Gutiérrez',
    carnetIdentidad: '44556677',
    nroLicencia: 'LIC008',
    imagen:
        'https://res.cloudinary.com/da9xsfose/image/upload/v1723300659/nb6dklpf7qlier6dv2oj.jpg',
    fechaEmision: '2024/08/20',
  ),
  DataLicencia(
    propietario: 'Ricardo Vargas',
    carnetIdentidad: '11224455',
    nroLicencia: 'LIC009',
    imagen:
        'https://res.cloudinary.com/da9xsfose/image/upload/v1723271282/cvkkvhgxqjfkhzaqd60o.jpg',
    fechaEmision: '2024/09/25',
  ),
  DataLicencia(
    propietario: 'Patricia Suárez',
    carnetIdentidad: '66778899',
    nroLicencia: 'LIC010',
    imagen:
        'https://res.cloudinary.com/da9xsfose/image/upload/v1723300654/vxdpryjennf96pqygdce.jpg',
    fechaEmision: '2024/10/30',
  ),
  DataLicencia(
    propietario: 'Santiago Muñoz',
    carnetIdentidad: '55664433',
    nroLicencia: 'LIC011',
    imagen:
        'https://res.cloudinary.com/da9xsfose/image/upload/v1723300659/nb6dklpf7qlier6dv2oj.jpg',
    fechaEmision: '2024/11/10',
  ),
  DataLicencia(
    propietario: 'Carmen Rojas',
    carnetIdentidad: '99882211',
    nroLicencia: 'LIC012',
    imagen:
        'https://res.cloudinary.com/da9xsfose/image/upload/v1723300654/vxdpryjennf96pqygdce.jpg',
    fechaEmision: '2024/12/15',
  ),
  DataLicencia(
    propietario: 'Andrés Pérez',
    carnetIdentidad: '22334455',
    nroLicencia: 'LIC013',
    imagen:
        'https://res.cloudinary.com/da9xsfose/image/upload/v1723300659/nb6dklpf7qlier6dv2oj.jpg',
    fechaEmision: '2024/12/20',
  ),
  DataLicencia(
    propietario: 'Natalia Castro',
    carnetIdentidad: '88776655',
    nroLicencia: 'LIC014',
    imagen:
        'https://res.cloudinary.com/da9xsfose/image/upload/v1723271282/cvkkvhgxqjfkhzaqd60o.jpg',
    fechaEmision: '2025/01/05',
  ),
  DataLicencia(
    propietario: 'Jorge Ruiz',
    carnetIdentidad: '55443322',
    nroLicencia: 'LIC015',
    imagen:
        'https://res.cloudinary.com/da9xsfose/image/upload/v1723271282/cvkkvhgxqjfkhzaqd60o.jpg',
    fechaEmision: '2025/02/15',
  ),
];

List<String> imagenesWallet = [
  "assets/coinbase-logo.png",
  "assets/Trust-logo.png",
  "assets/MetaMask-logo.png",
  "assets/Guarda_logo.png"
];
