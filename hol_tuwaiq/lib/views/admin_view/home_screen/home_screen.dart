import 'package:flutter/material.dart';

final colosss = Color(0xff4931AF);

class HomeScreenAdmin extends StatelessWidget {
  const HomeScreenAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: 140,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('logo/T.png', height: 60, width: 60),
                    Spacer(),
                    Text(
                      "X",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Image.asset('logo/h.png', height: 60, width: 60),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(24),
              padding: EdgeInsets.all(32),
              constraints: BoxConstraints(
                minHeight:
                    MediaQuery.of(context).size.height > 300
                        ? MediaQuery.of(context).size.height / 2
                        : 300,
              ),
              decoration: BoxDecoration(
                color: colosss.withAlpha(10),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Table(
                border: TableBorder.all(),

                columnWidths: const <int, TableColumnWidth>{
                  0: IntrinsicColumnWidth(flex: 0.2),
                  1: IntrinsicColumnWidth(flex: 0.8),
                  2: IntrinsicColumnWidth(flex: 0.8),
                  3: IntrinsicColumnWidth(flex: 0.8),
                  4: IntrinsicColumnWidth(flex: 0.2),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: <TableRow>[
                  TableRow(
                    children: <Widget>[
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.top,
                        child: Container(
                          height: 32,
                          width: 32,
                          color: colosss,
                          alignment: Alignment.center,

                          child: Text(
                            "ID",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.top,
                        child: Container(
                          height: 32,
                          width: 32,
                          color: colosss,
                          alignment: Alignment.center,

                          child: Text(
                            "Name",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.top,
                        child: Container(
                          height: 32,
                          width: 32,
                          color: Color(0xff4931AF),
                          alignment: Alignment.center,

                          child: Text(
                            "Topic",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.top,
                        child: Container(
                          height: 32,
                          width: 32,
                          color: Color(0xff4931AF),
                          alignment: Alignment.center,

                          child: Text(
                            "Question",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.top,
                        child: Container(
                          height: 32,
                          width: 32,
                          color: Color(0xff4931AF),
                          alignment: Alignment.center,
                          child: Text(
                            "Date",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  for (var x = 0; x < 10; x++) rowTableCustom(id: x),
                  // TableRow(
                  //   decoration: const BoxDecoration(color: colosss.withAlpha(10)),
                  //   children: <Widget>[
                  //     Container(height: 64, width: 128, color: Colors.purple),
                  //     Container(height: 32, color: Colors.yellow),
                  //     Center(
                  //       child: Container(height: 32, width: 32, color: Colors.orange),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                width: 200,
                height: 45,
                alignment: Alignment.center,
                child: Text("Export to Excel"),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: colosss),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [BoxShadow(offset: Offset(4, 4), color: colosss)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Data {
  Data();
}

rowTableCustom({required int id}) {
  return TableRow(
    children: <Widget>[
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.top,
        child: Center(child: Text(id.toString())),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.top,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Fahad Turki Mohammed Alazmi"),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.top,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Mobile developer"),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.top,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Flutter vs React native and how developer some of reole Flutter vs React native and how developer some of reole Flutter vs React native and how developer some of reole",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.top,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("10/10/2024"),
          ),
        ),
      ),
    ],
  );
}
