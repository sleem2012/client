import 'package:flutter/material.dart';
import '../../../shared/theme/colors.dart';

class FilterRangeSlider extends StatefulWidget {
  const FilterRangeSlider({Key? key, required this.onChange, required this.values}) : super(key: key);
  final Function(RangeValues values) onChange;
  final RangeValues values;

  @override
  State<FilterRangeSlider> createState() => _FilterRangeSliderState();
}

class _FilterRangeSliderState extends State<FilterRangeSlider> {
  RangeValues _selected = const RangeValues(1, 500);
  RangeLabels labels = const RangeLabels('1', "500");
  int divisions = 5;
  List strLabels = [];

  @override
  void initState() {
    super.initState();

    strLabels = [for (var i = 0; i <= _selected.end; i += (_selected.end ~/ divisions)) i];
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        sliderTheme: SliderThemeData(
          overlayShape: SliderComponentShape.noOverlay,
          trackHeight: 2,
          tickMarkShape: SliderTickMarkShape.noTickMark,
          rangeThumbShape: RoundRangeSliderThumbShape(enabledThumbRadius: 5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: RangeSlider(
          divisions: 4,
          activeColor: KColors.of(context).accentColor,
          inactiveColor: KColors.of(context).accentOpacity,
          min: widget.values.start,
          max: widget.values.end,
          values: _selected,
          labels: labels,
          onChanged: (value) {
            widget.onChange.call(value);
            setState(() {
              _selected = value;
              labels = RangeLabels("${value.start.toInt().toString()}\$", "${value.end.toInt().toString()}\$");
            });
          },
        ),
      ),
    );
  }
}
