import 'package:flutter/material.dart';
import 'package:chips_choice/chips_choice.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    List<String> options = [
      'News',
      'Entertainment',
      'Politics',
      'Automotive',
      'Sports',
      'Education',
      'Fashion',
      'Travel',
      'Food',
      'Tech',
      'Science',
    ];

    TextEditingController controllerName = TextEditingController();
    TextEditingController controllerTopic = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xffFEFEFE),
      appBar: AppBar(backgroundColor: Color(0xffFEFEFE)),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: 600,
              decoration: BoxDecoration(
                color: Color(0xffF7F9FF),
                border: Border.all(width: 3, color: Color(0xffC0C9E1)),
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
                      Align(
                        alignment: Alignment.center,
                        child: ChoicesWidget(options: options),
                      ),
                      SizedBox(height: 20),
                      Text(
                        ':الإسم',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 20),
                      ),
                      TextFeildWidget(controller: controllerName),
                      SizedBox(height: 20),
                      Text(
                        ':الموضوع',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 20),
                      ),
                      TextFeildWidget(maxLines: 3, controller: controllerTopic),
                      SizedBox(height: 30),
                      Align(
                        alignment: Alignment.center,
                        child: ButtonWidget(
                          onPressed: () {
                            if (formKey.currentState?.validate() == true) {
                              //send topic
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  const ButtonWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffFEFEFE),

        border: Border.all(width: 2, color: Color(0xff4931AF)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            'إرسال',
            style: TextStyle(color: Color(0xff4931AF), fontSize: 20),
          ),
        ),
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
  const ChoicesWidget({super.key, required this.options});

  @override
  State<ChoicesWidget> createState() => _ChoicesWidgetState();
}

class _ChoicesWidgetState extends State<ChoicesWidget> {
  int tag = 0;
  @override
  Widget build(BuildContext context) {
    return ChipsChoice<int>.single(
      value: tag,
      onChanged: (val) => setState(() => tag = val),

      choiceItems: C2Choice.listFrom<int, String>(
        source: widget.options,
        value: (i, v) => i,
        label: (i, v) => v,
      ),
      choiceCheckmark: true,
      choiceStyle: C2ChipStyle.filled(
        selectedStyle: const C2ChipStyle(backgroundColor: Color(0xff4931AF)),
      ),
      wrapped: true,
    );
  }
}
