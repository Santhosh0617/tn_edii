import 'package:flutter/material.dart';
import 'package:tn_edii/constants/assets/local_images.dart';
import 'package:tn_edii/models/resource_type.dart';

class ResourceProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  List<ResourceType> resourceTypes = [
    ResourceType(resource: 'Articles', image: LocalImages.articles),
    ResourceType(resource: 'Videos', image: LocalImages.videos),
    ResourceType(resource: 'E-Books', image: LocalImages.eBooks),
    ResourceType(resource: 'Tools', image: LocalImages.tools),
  ];
}
