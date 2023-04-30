import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_flutter/screen/course/pdfScreen/pdf_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../widgets/custom_app_bar.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({Key? key, required this.nameFile, required this.url})
      : super(key: key);
  final String nameFile;
  final String url;

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
                        appBarName: widget.nameFile,
                        backgroundColor: Colors.transparent),
                  ),
                  body: Container(child: SfPdfViewer.network(widget.url))));
        }));
  }
}
