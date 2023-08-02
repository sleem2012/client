import 'package:freezed_annotation/freezed_annotation.dart';
part 'dynamic_fields_union.freezed.dart';

@freezed
 class DynamicFieldsType with _$DynamicFieldsType {
  const factory DynamicFieldsType.textField() = DynamicFieldsTypeTextField;
  const factory DynamicFieldsType.checkbox() = DynamicFieldsTypeCheckbox;
  const factory DynamicFieldsType.radioButton() = DynamicFieldsTypeRadioButton;
  const factory DynamicFieldsType.dropDownButton() = DynamicFieldsTypeDropDownButton;
  const factory DynamicFieldsType.dateTimePiker() = DynamicFieldsTypeDateTimePiker;
  const factory DynamicFieldsType.fileInput() = DynamicFieldsTypeDateFileInput;
  const factory DynamicFieldsType.imageInput() = DynamicFieldsTypeDateImageInput;
  const factory DynamicFieldsType.tree() = DynamicFieldsTypeDateTree;
  const factory DynamicFieldsType.non() = DynamicFieldsTypeDateNON;

  static const List<String> types = ['TextField', 'Checkbox', 'RadioButton', 'DropDownButton', 'DateTimePiker', 'FileInput', 'ImageInput'];

  static DynamicFieldsType fromString(String? type) {
    switch (type) {
      case 'TextField':
        return const DynamicFieldsType.textField();
      case 'Checkbox':
        return const DynamicFieldsType.checkbox();
      case 'RadioButton':
        return const DynamicFieldsType.radioButton();
      case 'DropDownButton':
        return const DynamicFieldsType.dropDownButton();
      case 'DateTimePiker':
        return const DynamicFieldsType.dateTimePiker();
      case 'FileInput':
        return const DynamicFieldsType.fileInput();
      case 'ImageInput':
        return const DynamicFieldsType.imageInput();
      case 'Tree':
        return const DynamicFieldsType.tree();
      default:
        return const DynamicFieldsType.non();
    }
  }


}

// flutter pub run build_runner watch --delete-conflicting-outputs
