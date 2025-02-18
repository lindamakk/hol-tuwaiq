import 'package:flutter/material.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hol_tuwaiq/views/user_view/cubit/home_user_cubit.dart';

class HomeScreenUser extends StatelessWidget {
  const HomeScreenUser({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => HomeUserCubit(),
      child: Scaffold(
        backgroundColor: Color(0xffFEFEFE),

        body: SingleChildScrollView(
          child: Builder(
            builder: (context) {
              final bloc = context.read<HomeUserCubit>();
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
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        width: 600,
                        decoration: BoxDecoration(
                          color: Color(0xffF7F9FF),
                          border: Border.all(
                            width: 3,
                            color: Color(0xffC0C9E1),
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Form(
                          key: formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '!أرسل سؤالك',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'أرسل استفسارك بخصوص أي من الموضوعات التالية ليتم مناقشتها في ورش العمل المستقبلية',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  ':المجال',

                                  textAlign: TextAlign.right,
                                  style: TextStyle(fontSize: 20),
                                ),
                                BlocBuilder<HomeUserCubit, HomeUserState>(
                                  builder: (context, state) {
                                    if (state is LoadingScopesState) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    if (state is ErrorState) {
                                      return Text("Please try again later");
                                    }
                                    return ChoicesWidget(
                                      options: bloc.topics,
                                      onTagChanged: (selectedIndex) {
                                        bloc.selectedTopic = bloc.topicsObjects!
                                            .firstWhere(
                                              (topic) =>
                                                  topic.nameEn ==
                                                  bloc.topics[selectedIndex],
                                            );
                                      },
                                    );
                                  },
                                ),
                                SizedBox(height: 20),
                                Text(
                                  ':الإسم',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(fontSize: 20),
                                ),

                                TextFeildWidget(
                                  controller: bloc.controllerName,
                                ),

                                SizedBox(height: 20),
                                Text(
                                  ':الموضوع',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(fontSize: 20),
                                ),
                                TextFeildWidget(
                                  maxLines: 3,
                                  controller: bloc.controllerTopic,
                                ),
                                SizedBox(height: 30),
                                BlocListener<HomeUserCubit, HomeUserState>(
                                  listener: (context, state) {
                                    if (state is LoadingState) {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                      );
                                    }
                                    if (state is SuceessSendState) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Your Question Has Been Send Successfully!',
                                          ),
                                        ),
                                      );
                                      Navigator.pop(
                                        context,
                                      ); // pop out of loading
                                    }
                                    if (state is ErrorState) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Please Try Again Later.',
                                          ),
                                        ),
                                      );
                                      Navigator.pop(
                                        context,
                                      ); // pop out of loading
                                    }
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: ButtonWidget(
                                      buttonText: 'إرسال',
                                      onPressed: () {
                                        if (formKey.currentState?.validate() ==
                                                true ||
                                            bloc.selectedTopic != null) {
                                          bloc.sendQuestion();
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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

class ButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;
  const ButtonWidget({super.key, this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: 200,
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xff4931AF)),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(offset: Offset(4, 4), color: Color(0xff4931AF)),
          ],
        ),
        child: Text(buttonText),
      ),
    );
  }
}

class TextFeildWidget extends StatelessWidget {
  final int? maxLines;
  final TextEditingController? controller;
  const TextFeildWidget({super.key, this.maxLines, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffFEFEFE),
          border: Border.all(width: 1, color: Color(0xffC0C9E1)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter Somthing';
            }
            return null;
          },
          controller: controller,
          textAlign: TextAlign.end,
          maxLines: maxLines ?? 1,
          decoration: InputDecoration(
            fillColor: Color(0xffFEFEFE),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class ChoicesWidget extends StatefulWidget {
  final List<String> options;
  final Function(int) onTagChanged;

  const ChoicesWidget({
    super.key,
    required this.options,
    required this.onTagChanged,
  });

  @override
  State<ChoicesWidget> createState() => _ChoicesWidgetState();
}

class _ChoicesWidgetState extends State<ChoicesWidget> {
  int tag = 0;
  @override
  Widget build(BuildContext context) {
    return ChipsChoice<int>.single(
      value: tag,
      onChanged: (val) {
        setState(() {
          tag = val;
        });
        widget.onTagChanged(tag); // Call the callback when the tag changes
      },

      choiceItems: C2Choice.listFrom<int, String>(
        source: widget.options,
        value: (i, v) => i,
        label: (i, v) => v,
      ),

      choiceStyle: C2ChipStyle.filled(
        color: Color(0xffC0C9E1),
        selectedStyle: const C2ChipStyle(backgroundColor: Color(0xff4931AF)),
      ),
      wrapped: true,
    );
  }
}
