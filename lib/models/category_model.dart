class CategoryModel{
  final String _label;
  final String _icon;
  const CategoryModel(String label, String icon):_label = label,_icon = icon;
  String getLabel()=>_label;
  String getIcon()=>_icon;
}