class AssetImages {
  AssetImages._();

  static String _getAssetIconSvg(String fileName) => 'assets/images/$fileName.svg';

  static String _getAssetIconPng(String fileName) => 'assets/images/$fileName.png';

  static String _getAssetIconJpg(String fileName) => 'assets/images/$fileName.jpg';

  static String icStar = _getAssetIconSvg('ic_star');

}
