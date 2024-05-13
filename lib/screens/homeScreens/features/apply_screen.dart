import 'package:flutter/material.dart';
import 'package:jobapp/common/constants/k_button.dart';
import 'package:jobapp/common/constants/text_field.dart';
import 'package:jobapp/common/ui_helpers.dart';
import 'package:jobapp/provider/features/apply_job.dart';
import 'package:jobapp/themes/app_themes.dart';
import 'package:provider/provider.dart';

class ApplyScreen extends StatelessWidget {
  const ApplyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final applyState = Provider.of<ApplyState>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appPrimColor,
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Center(
                child: Text(applyState.jobTitle ?? 'N/A'),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    elHeightSpan,
                    kTextFormFIeld(
                      onChanged: applyState.onCoverLetterChanged,
                      obscureText: false,
                      labelText: 'Cover Letter',
                      maxLine: null,
                    ),
                    lHeightSpan,
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Given Salary',
                                style: AppTheme()
                                    .lightTheme
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.black),
                              ),
                              sHeightSpan,
                              Text(applyState.jobSalary ?? 'N/A'),
                            ],
                          ),
                        ),
                        lWidthSpan,
                        Expanded(
                          child: kTextFormFIeld(
                            onChanged: applyState.onSalaryDemandChanged,
                            obscureText: false,
                            labelText: 'Demanded Salary',
                          ),
                        )
                      ],
                    ),
                    lHeightSpan,
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Location',
                                style: AppTheme()
                                    .lightTheme
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.black),
                              ),
                              sHeightSpan,
                              Text(applyState.location ?? 'N/A'),
                            ],
                          ),
                        ),
                        elWidthSpan,
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Company',
                                style: AppTheme()
                                    .lightTheme
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.black),
                              ),
                              sHeightSpan,
                              Text(applyState.company ?? 'N/A'),
                            ],
                          ),
                        )
                      ],
                    ),
                    elHeightSpan,
                    Row(
                      children: [
                        Text('Upload a CV!! '),
                        lHeightSpan,
                        TextButton(
                          onPressed: () {
                            applyState.pickPDF();
                          },
                          child: Text('Upload'),
                        ),
                      ],
                    ),
                    sHeightSpan,
                    if (applyState.pdfFile != null) ...[
                      SizedBox(height: 20),
                      Text('Selected PDF: ${applyState.pdfFile!.path}'),
                      SizedBox(height: 20),
                      LinearProgressIndicator(
                        value: applyState.uploadProgress ?? 0.0,
                      ),
                    ],
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: SizedBox(
                      child: KButton(
                        onPressed: () {
                          applyState.applyJob();
                        },
                        child: Text('Apply'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
