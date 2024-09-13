import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:http/http.dart' as http;
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/constants/keys.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/utilities/custom_date_time.dart';
import 'package:tn_edii/utilities/extensions/string_extenstion.dart';
import 'package:tn_edii/utilities/message.dart';

class PdfView extends StatefulWidget {
  // final String pdfPath;
  // final String documentName;

  const PdfView({
    // required this.pdfPath,
    // required this.documentName,
    super.key,
  });

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  String get path => (GoRouterState.of(context).extra ?? "") as String;
  // String get documentname => params["documentName"];
  // String get document => params["pdfPath"];
  DateTime? time = CustomDateTime().now;

  @override
  Widget build(BuildContext context) {
    String fileName = path;
    String fileUrl = path.toImageUrl();
    return CustomScaffold(
        isStackedAppBar: false,
        color: Palette.bg,
        appBar: AppBarCommon(
          automaticLeadingImplies: true,
          isText: false,
          title: "Resources",
          actions: [
            if (fileUrl.isNotEmpty)
              InkWell(
                  onTap: () {
                    downloadPDF(fileUrl, fileName);
                  },
                  child: Icon(
                    Icons.download,
                    color: Palette.dark,
                  ))
          ],
        ),
        body: fileUrl.isEmpty ? SizedBox() : SfPdfViewer.network(fileUrl));
  }

  void downloadPDF(String url, String fileName) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final bytes = response.bodyBytes;
      final formattedDate =
          DateFormat('ddMMMyyyyhhmm').format(CustomDateTime().now);
      final pdfFile =
          File('/storage/emulated/0/Download/${fileName}_$formattedDate.pdf');
      logger.w(pdfFile);
      await pdfFile.writeAsBytes(bytes);
      showMessage('PDF downloaded successfully');
    } else {
      showMessage('Failed to download PDF');
    }
  }
}


//  onDownload: () {
//             downloadPDF(fileUrl, fileName);
//           },


