import 'package:examen_e2/utils/style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final rows = <TableRow>[];

  @override
  void initState() {
    super.initState();
    addRows();
  }

  void addRows() {
    var list = [
      {
        "Nombre": "ACCION SOCIAL Y DESARROLLO",
        "Sigla": "ASDE",
        "Representante": "QUISPE CHURA, RAFAEL /",
      },
      {
        "Nombre":
            "ASOCIACION CIVIL RELIGIOSA SAN ANDRES SOLIDARIDAD Y DESARROLLO",
        "Sigla": "SASDE",
        "Representante": "PULIDO HUARANGA, ANDRES / ANGELES GONZALES, GILMER /",
      },
      {
        "Nombre": "ASOCIACION PARA EL DESARROLLO, EDUCACION Y ECOLOGIA",
        "Sigla": "ASDECO",
        "Representante": "PICON CARDENAS, LILIA ISIDORA /",
      },
      {
        "Nombre": "CENTRO DE ESTUDIOS DESARROLLO SOLIDARIDAD Y DEMOCRACIA",
        "Sigla": "DSD",
        "Representante": "ARNAO LAOS, SEGUNDO AURELIO /"
      },
      {
        "Nombre": "ONG ALTERNATIVA SOLIDARIA PARA EL DESARROLLO EN SUDAMERICA",
        "Sigla": "ASDESA",
        "Representante": "HUAMAN GAMARRA, MERY CRISTINA /",
      }
    ];

    rows.add(TableRow(children: [
      Column(children: [
        Text('Nombre', style: titles),
      ]),
      Column(children: [
        Text('Sigla', style: titles),
      ]),
      Column(children: [
        Text('Representate', style: titles),
      ]),
    ]));

    for (var item in list) {
      rows.add(TableRow(children: [
        Column(children: [
          Text(item['Nombre']),
        ]),
        Column(children: [
          Text(item['Sigla']),
        ]),
        Column(children: [
          Text(item['Representante']),
        ]),
      ]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E2"),
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(children: [_tyIntituto(), _search(), _table()])
          ],
        ),
      ),
    );
  }

  Widget _tyIntituto() {
    return Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Tipo Institución:"),
          SizedBox(width: 30),
          SelectItems()
        ]);
  }

  Widget _search() {
    return Container(
      width: 350,
      height: 150,
      margin: EdgeInsets.symmetric(vertical: 50),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GroupFroms(),
      ),
    );
  }

  Widget _table() {
    return Container(
      width: 350,
      child: Table(
          columnWidths: {
            0: FlexColumnWidth(1.0),
            2: FlexColumnWidth(1.2),
          },
          border: TableBorder.all(),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: rows),
    );
  }
}

class GroupFroms extends StatefulWidget {
  @override
  _GroupFromsState createState() => _GroupFromsState();
}

class _GroupFromsState extends State<GroupFroms> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Buscador"),
        _form("Ingrese Nombre :"),
        _form("Ruc :"),
      ],
    );
  }

  Widget _form(String title) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title),
        Container(
          width: 180,
          height: 30,
          decoration: BoxDecoration(color: Colors.white),
          child: TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.red,
                border: InputBorder.none,
              ),
              style: TextStyle(fontFamily: "Poppins", fontSize: 14)),
        ),
      ]),
    );
  }
}

class SelectItems extends StatefulWidget {
  @override
  _SelectItemsState createState() => _SelectItemsState();
}

class _SelectItemsState extends State<SelectItems> {
  String dropdownValue = 'Ipreda';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Ipreda', 'ONGD', 'ENIEX']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
