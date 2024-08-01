import 'package:flutter/material.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/theme/palette.dart';

class CurriculumListTile extends StatelessWidget {
  const CurriculumListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Palette.wavyBlueBorder,width: 2),
            color: Palette.wavyBlue),
            child: Center(child: TextCustom("1",size: 14,fontWeight: FontWeight.w800,)),
      ),
      title: TextCustom("Why Using Graphic De huoiefwugeufgeur ugfiurg iu",size: 16,fontWeight: FontWeight.w600,maxLines: 1,),
      subtitle: TextCustom("15 Mins",size: 12,fontWeight: FontWeight.w600,color: Palette.grey,),
      trailing: Container(
        height: 25,
        width: 25,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Palette.primary,
        ),
        child: const Icon(
          Icons.play_arrow,
          color: Colors.white,
          size: 20,
        ),
      ) ,
    );
  }
}