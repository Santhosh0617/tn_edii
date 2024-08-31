import 'package:flutter/material.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/assets/local_images.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/utilities/extensions/context_extention.dart';

class ReviewsCard extends StatelessWidget {
  const ReviewsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical:SizeUnit.lg),
      // height: 96,
      width: context.widthFull(),
      decoration: const BoxDecoration(
        // color: Palette.pureWhite
      ),
          child:  Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(LocalImages.js),
                radius: 28,
              ),
              const WidthFull(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TextCustom("Will",size: 18,fontWeight: FontWeight.w700,color: Palette.dark,),
                        Container(
                          height: 25,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: Colors.blue
                            ),
                            color: Palette.wavyBlueBorder
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.star,color: Palette.yellow,size: 20,),
                              TextCustom("4.4",fontWeight: FontWeight.w700,)
                            ],
                          ),
                        )
                      ],
                    ),
                    const HeightHalf(),
                    const TextCustom("yfiuregfurgufg ugfu guurg uuouru iuoiurougf ouougougrwoufg ugoiugogf gugrg ogourfg",color: Palette.grey,fontWeight: FontWeight.w600,),
                    const HeightFull(multiplier: 2,),
                    const Row(
                      children: [
                         Row(
                          children: [
                            Icon(Icons.favorite,color: Palette.red,),
                            WidthHalf(),
                            TextCustom("578",fontWeight: FontWeight.w800,color: Palette.dark,size: 15,)
                          ],
                        ),
                        WidthFull(),
                        TextCustom("2 Weeks Ago",fontWeight: FontWeight.w800,color: Palette.dark,size: 15,)
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
    );
  }
}