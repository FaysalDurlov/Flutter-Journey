void main(){
  Set<String> colors = {"red", "green", "blue"};
  Set<String> primaryColors = {"red", "blue", "yellow"};
  Set<String> secondaryColors = {"green", "purple", "orange"};


  var allColors = primaryColors.union(secondaryColors);
  print("All colors: $allColors");
  
  // Intersection
  var commonColors = colors.intersection(primaryColors);
  print("Common colors: $commonColors");
  
  // Difference
  var onlyPrimary = colors.difference(secondaryColors);
  print("Only primary: $onlyPrimary");

}