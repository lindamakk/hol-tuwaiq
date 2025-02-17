import 'package:flutter/material.dart';
import 'package:chips_choice/chips_choice.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Color(0xffFEFEFE),
      appBar: AppBar(backgroundColor: Color(0xffFEFEFE)),
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
            Center(
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
                          ChoicesWidget(),
                          SizedBox(height: 20),
                          Text(
                            ':الإسم',
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 20),
                          ),

                          TextFeildWidget(),

                          SizedBox(height: 20),
                          Text(
                            ':الموضوع',
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFeildWidget(maxLines: 3),
                          SizedBox(height: 30),
                          Align(
                            alignment: Alignment.center,
                            child: ButtonWidget(
                              onPressed: () {
                                if (formKey.currentState?.validate() == true) {
                                  print('object');
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
          ],
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
  const ChoicesWidget({super.key});

  @override
  State<ChoicesWidget> createState() => _ChoicesWidgetState();
}

class _ChoicesWidgetState extends State<ChoicesWidget> {
  int tag = 0;
  @override
  Widget build(BuildContext context) {
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
    return ChipsChoice<int>.single(
      value: tag,
      onChanged: (val) => setState(() => tag = val),

      choiceItems: C2Choice.listFrom<int, String>(
        source: options,
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
