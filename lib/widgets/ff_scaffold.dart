import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:wid_gen/wid_gen.dart';
import 'package:wid_gen/widgets/ff_appbar.dart';
import 'package:wid_gen/widgets/ff_container.dart';

class FFScaffold extends WidGen {
  // FFScaffold({Key? key}) : super(key: key);
  FFScaffold({Key? key, required String keyID}) : super(key: key, keyID: keyID);

  @override
  String? get json => "";

  // @override
  // String? get keyID => const Uuid().v1();

  @override
  Widget get wiget => Scaffold(
        body: widBody,
        // appBar: (widBar is ActionBar)? widBar!.getWidget().wiget :null,
      );

  Widget? widBody;

  Widget? widBar;

  Widget? widBottom;
  Widget? widBodyOld;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widBody != null
          ? widBody!
          : DragTarget<Widget>(
              onWillAccept: (v) {
                return widBody != null ? false : true;
              },
              onAccept: (value) {
                // setState(() {
                widBody = value;
                widBodyOld = value;
                // });
                (context as Element).markNeedsBuild();
              },
              onLeave: (value) {
                print("Leave");
                // setState(() {
                widBody = widBodyOld;
                // });
              },
              builder: (_, candidateData, rejectedData) {
                return widBody != null
                    ? widBody!
                    : Placeholder(
                        color: Colors.red,
                      );
              },
            ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: FFActionBar(height: 50,keyID: const Uuid().v1()),
      ),
    );
  }
}
