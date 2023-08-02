import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../di.dart';
import '../../logic/pick_image/pick_image_cubit.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/text_theme.dart';

import '../../shared/theme/helper.dart';
import '../../packages/widgets/image_widget.dart';

class PickImageWidget extends StatefulWidget {
  final String? initialImg;
  final String? hint;

  const PickImageWidget(
      {Key? key, required this.onSelect, this.initialImg, required this.hint})
      : super(key: key);

  final Function(File? file) onSelect;

  @override
  State<PickImageWidget> createState() => _PickImageWidgetState();
}

class _PickImageWidgetState extends State<PickImageWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.pickImageCubit,
      child: BlocBuilder<PickImageCubit, PickImageState>(
        builder: (context, state) {
          final cubit = context.read<PickImageCubit>();
          return InkWell(
            onTap: () async {
              File? file = await cubit.pickImage();

              if (file != null) {
                widget.onSelect(file);
              }
            },
            child: Container(
              width: 200,
              height: 140,
              decoration: BoxDecoration(
                  color: KColors.of(context).elevatedBox,
                  shape: BoxShape.circle),
              child: (state is PickImageInitial && widget.initialImg != null)
                  ? Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: KImageWidget(
                          imageUrl: widget.initialImg!,
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        ),
                      ),
                    )
                  : state is PickImageSuccess && cubit.image != null
                      ? Container(
                          height: 200,
                          width: 140,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: FileImage(cubit.image!),
                                fit: BoxFit.cover),
                          ),
                        )
                      : state is PickImageError
                          ? Text(state.error)
                          : state is PickImageLoading
                              ? const Center(child: CircularProgressIndicator())
                              : Center(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/images/add.png'),
                                        const SizedBox(height: 20),
                                        Text(widget.hint!,
                                            textAlign: TextAlign.center,
                                            style:
                                                KTextStyle.of(context).title3),
                                      ],
                                    ),
                                  ),
                                ),
            ),
          );
        },
      ),
    );
  }
}


class PickProImageWidget extends StatelessWidget {
  const PickProImageWidget({
    Key? key,
    this.initialImg,
    required this.onSelect,
    this.maxWidth = 720,
    this.maxHeight = 1280,
    this.radius,
    this.imageQuality = 100,
    this.isAvatar = false,
    this.validator,
  }) : super(key: key);

  final String? initialImg;
  final Function(File? file) onSelect;
  final double? maxWidth;
  final double? maxHeight;
  final double? radius;
  final int? imageQuality;
  final bool isAvatar;
  final String? Function(File?)? validator;

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry borderRadius = BorderRadius.circular(20);
    return BlocProvider(
      create: (context) => Di.pickImageCubit..setter(maxWidth, maxHeight, imageQuality),
      child: BlocBuilder<PickImageCubit, PickImageState>(
        builder: (context, state) {
          final cubit = context.read<PickImageCubit>();
          return FormField<File?>(
            validator: validator,
            builder: (formState) {
              return Container(
                height: radius ?? 70,
                width: radius ?? 70,
                decoration: KHelper.of(context).roundedFields.copyWith(
                      borderRadius: borderRadius,
                      border: formState.hasError ? KHelper.of(context).eBorder : null,
                    ),
                child: RawMaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: borderRadius),
                  elevation: 0,
                  onPressed: () async {
                    File? file = await cubit.pickImage();
                    if (file != null) {
                      onSelect(file);
                      formState
                        ..didChange(file)
                        ..validate();
                    }
                  },
                  child: SizedBox(
                    height: radius ?? 70,
                    width: radius ?? 70,
                    child: ClipRRect(
                      borderRadius: borderRadius,
                      child: (state is PickImageInitial && initialImg != null)
                          ? KImageWidget(imageUrl: initialImg!, fit: BoxFit.cover)
                          : (state is PickImageSuccess && cubit.image != null)
                              ? Image.file(cubit.image!, fit: BoxFit.cover)
                              : Icon(Icons.camera, size: (radius ?? 70) * .25),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
