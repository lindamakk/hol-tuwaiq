import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hol_tuwaiq/model/question_model.dart';
import 'package:hol_tuwaiq/views/admin_view/home_screen/cubit/home_admin_cubit.dart';

final colosss = Color(0xff4931AF);

class HomeScreenAdmin extends StatelessWidget {
  const HomeScreenAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeAdminCubit(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Builder(
            builder: (context) {
              final bloc = context.read<HomeAdminCubit>();
              bloc.startLoad();
              return Column(
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
                    child: Column(
                      children: [
                        BlocBuilder<HomeAdminCubit, HomeAdminState>(
                          builder: (context, state) {
                            if (state is LoadingState) {
                              return Center(child: CircularProgressIndicator());
                            }
                            if (state is ErrorState) {
                              return Text("data");
                            }
                            return Table(
                              border: TableBorder.all(),

                              columnWidths: const <int, TableColumnWidth>{
                                0: IntrinsicColumnWidth(flex: 0.2),
                                1: IntrinsicColumnWidth(flex: 0.8),
                                2: IntrinsicColumnWidth(flex: 0.8),
                                3: IntrinsicColumnWidth(flex: 0.8),
                                4: IntrinsicColumnWidth(flex: 0.2),
                              },
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: <TableRow>[
                                TableRow(
                                  children: <Widget>[
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.top,
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
                                      verticalAlignment:
                                          TableCellVerticalAlignment.top,
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
                                      verticalAlignment:
                                          TableCellVerticalAlignment.top,
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
                                      verticalAlignment:
                                          TableCellVerticalAlignment.top,
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
                                      verticalAlignment:
                                          TableCellVerticalAlignment.top,
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
                                ...List.generate(
                                  bloc.dataQ.length,
                                  (index) => rowTableCustom(
                                    id: index + 1,
                                    dataRow: bloc.dataQ[index],
                                  ),
                                ),
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
                            );
                          },
                        ),
                        SizedBox(height: 6),
                        InkWell(
                          onTap: () {},

                          child: Container(
                            width: 200,
                            height: 45,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: colosss),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(offset: Offset(4, 4), color: colosss),
                              ],
                            ),
                            child: Text("Export to Excel"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class Data {
  Data();
}

rowTableCustom({required QuestionModel dataRow, required int? id}) {
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
            child: Text(dataRow.nameStudent),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.top,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(dataRow.topics.nameEn),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.top,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(dataRow.question, textAlign: TextAlign.center),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.top,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(dataRow.dateAdd),
          ),
        ),
      ),
    ],
  );
}
