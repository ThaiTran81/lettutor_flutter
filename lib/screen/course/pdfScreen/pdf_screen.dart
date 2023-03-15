import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_flutter/screen/course/pdfScreen/pdf_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../widgets/custom_app_bar.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({Key? key}) : super(key: key);

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PdfScreenProvider(),
        child: Consumer<PdfScreenProvider>(builder: (context, provider, _) {
          return SafeArea(
              child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(70.h),
                    child: CustomAppBar(
                        appBarName: 'The Internet',
                        backgroundColor: Colors.transparent),
                  ),
                  body: Container(
                      child: SfPdfViewer.network(
                          'https://api.app.lettutor.com/file/be4c3df8-3b1b-4c8f-a5cc-75a8e2e6626afileThe%20Internet.pdf'))));
        }));
  }
}
