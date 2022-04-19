
import 'package:music_playlist/utils/helpers/size_config.dart';

class Spacing{
  static double horizontal = getProportionateScreenWidth(inputWidth: 8);
  static double horizontalHalfSpace = getProportionateScreenWidth(inputWidth: 4);
  static double horizontalDouble = getProportionateScreenWidth(inputWidth: 16);
  static double horizontalExtraSpace = getProportionateScreenWidth(inputWidth: 32);

  static double vertical = getProportionateScreenHeight(inputHeight: 16);
  static double verticalDoubleSpace = getProportionateScreenHeight(inputHeight: 32);
  static double verticalSubTitle = getProportionateScreenHeight(inputHeight: 4);
  static double verticalHalfSpace = getProportionateScreenHeight(inputHeight: 8);
  static double verticalMiniSpace = getProportionateScreenHeight(inputHeight: 2);

  static double padding = 20;
  static double paddingCircularImage = 8;

}