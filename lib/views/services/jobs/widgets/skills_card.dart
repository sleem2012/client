import 'package:flutter/material.dart';
import '../../../../packages/extensions.dart';
import '../../../../logic/jobs/get_jobs/get_jobs_bloc.dart';
import '../../../../shared/theme/text_theme.dart';

class SkillsCard extends StatelessWidget {
  SkillsCard({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GetJobsBloc jobs=GetJobsBloc.of(context);
    return Wrap(
      children: List.generate(
        jobs.skills.length ,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 8),
          child: SizedBox(
            height: 30,
            child: RawMaterialButton(
              padding: const EdgeInsets.all(3),
              onPressed: () {},
              fillColor: Color(0xff92CCCF),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              child: Text(
                jobs.skills[index].value?.value ?? '',
                style: KTextStyle.of(context).black_grey_bold.S(1.3),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
