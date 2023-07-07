import 'package:flutter/material.dart';

import '../components/images_paths.dart';
import '../models/language_model.dart';

List<LanguageModel> languages = [
  LanguageModel(
      name: 'English',
      id: 1,
      image: Images.sh,
      locale: const Locale('en', 'US')),
  LanguageModel(
      name: 'Spanish',
      id: 2,
      image: Images.es,
      locale: const Locale('es', 'ES')),
  
];
