import 'package:flutter/material.dart';
import '../../../../data/models/jobs/jobs_model.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/colors.dart';
import '../../../../shared/theme/helper.dart';
import '../../../../shared/theme/text_theme.dart';
import '../jobs_details_screen.dart';
import 'package:get/get.dart';

class JobCard extends StatelessWidget {
  const JobCard({Key? key, required this.data}) : super(key: key);
  final JobData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: KHelper.of(context).elevatedBox,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.title ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              // ClipOval(
              //   child: SizedBox.fromSize(
              //     size: const Size.fromRadius(20),
              //     // Image radius
              //     child: Image.network(
              //         'https://img.freepik.com/free-photo/no-problem-concept-bearded-man-makes-okay-gesture-has-everything-control-all-fine-gesture-wears-spectacles-jumper-poses-against-pink-wall-says-i-got-this-guarantees-something_273609-42817.jpg?w=1380&t=st=1663594307~exp=1663594907~hmac=01265605547ba68a2ad79aa371859beb62af364104c997ad0dc708f521c3e4c2',
              //         fit: BoxFit.cover),
              //   ),
              // ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.location_pin,
                color: KColors.of(context).accentColor,
                size: 15,
              ),
              const SizedBox(width: 5),
              SizedBox(
                width: Get.width / 1.4,
                child: Text(
                  data.addressId?.detailedAddress ?? '',
                  style: const TextStyle(fontSize: 13),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 70,
                    height: 20,
                    child: RawMaterialButton(
                      onPressed: () {},
                      fillColor: KColors.of(context).freeShiping,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        data.employmentType ?? '',
                        style: KTextStyle.of(context).editBTN.copyWith(
                              fontSize: 10,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '${data.experienceYears} of Exp',
                    style: TextStyle(
                      color: KColors.of(context).accentColor,
                      fontSize: 10,
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 70,
                height: 20,
                child: RawMaterialButton(
                  onPressed: () {
                    Get.to(() => JobsDetailsScreen(jobData: data));
                  },
                  fillColor: KColors.of(context).freeShiping,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    Tr.get.view,
                    style: KTextStyle.of(context).editBTN.copyWith(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (data.categories != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.categories?.category?.name?.value ?? '',
                        style: KTextStyle.of(context).body.copyWith(fontSize: 12, color: KColors.of(context).accentColor, fontWeight: FontWeight.bold)),
                    SizedBox(
                        width: Get.width / 1.4,
                        child: Wrap(
                          children: (data.categories?.skillsCollection ?? []).map((e) {
                            return Text(
                              '${e.value?.value}  ',
                              style: const TextStyle(fontSize: 10),
                            );
                          }).toList(),
                        ))
                  ],
                ),
              Text(
                '${data.closedAt}',
                style: const TextStyle(fontSize: 7, color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}
