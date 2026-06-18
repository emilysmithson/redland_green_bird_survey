import 'package:flutter/material.dart';

class CustomStep {
  int? stepNumber;
  String? title;
  Widget? content;
  Function? onNext;
  bool? isFirst = false;
  bool? isLast = false;
  bool? proceed;
  String? errorMsg;
  CustomStep({
    this.stepNumber,
    this.title,
    this.content,
    this.onNext,
    this.isLast,
    this.isFirst,
    this.proceed,
    this.errorMsg,
  });
}

class CustomStepper extends StatefulWidget {
  final List<CustomStep>? customStepList;

  const CustomStepper({super.key, this.customStepList});
  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int currentPage = 0;
  bool showErrorMsg = false;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      onPageChanged: (newPage) {
        currentPage = newPage;
      },
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: widget.customStepList!.map((CustomStep step) {
        return customStep(step: step);
      }).toList(),
    );
  }

  Widget customStep({required CustomStep step}) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              child: Text(
                '${step.stepNumber.toString()}. ${step.title}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(child: step.content!),
            if (showErrorMsg)
              Text(
                step.errorMsg ?? '',
                style: const TextStyle(color: Colors.red),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Visibility(
                  visible: !step.isFirst!,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.green[100],
                    ),
                    onPressed: () {
                      currentPage--;
                      controller.animateToPage(
                        currentPage,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Row(
                      children: const [
                        Text('Back', style: TextStyle(color: Colors.black)),
                        Icon(Icons.keyboard_arrow_up, color: Colors.black),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.green[100],
                  ),
                  onPressed: () {
                    if (step.proceed!) {
                      setState(() {
                        showErrorMsg = false;
                      });
                      widget.customStepList![currentPage].onNext!();
                      if (!widget.customStepList![currentPage].isLast!) {
                        currentPage++;
                        controller.animateToPage(
                          currentPage,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeIn,
                        );
                      }
                    } else {
                      setState(() {
                        showErrorMsg = true;
                      });
                    }
                  },
                  child: Row(
                    children: [
                      Text(
                        step.isLast! ? 'Submit' : 'Next',
                        style: const TextStyle(color: Colors.black),
                      ),
                      step.isLast!
                          ? const SizedBox(width: 30)
                          : const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
