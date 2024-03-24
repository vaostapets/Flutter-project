import 'dart:io';

import 'package:flutter/material.dart';

List<Image> images = [
  Image.asset('assets/Images/News1.jpg',
      width: 380, height: 210, fit: BoxFit.cover),
  Image.asset('assets/Images/News3.jpg',
      width: 380, height: 210, fit: BoxFit.cover),
  Image.asset('assets/Images/News4.jpg',
      width: 380, height: 210, fit: BoxFit.cover),
  Image.asset('assets/Images/News5.jpg',
      width: 380, height: 210, fit: BoxFit.cover),
  Image.asset('assets/Images/DayOffer.jpg',
      width: 380, height: 210, fit: BoxFit.cover),
  Image.asset('assets/Images/DayOffer2.jpg',
      width: 380, height: 210, fit: BoxFit.cover),
  Image.asset('assets/Images/Yoga.jpg',
      width: 380, height: 210, fit: BoxFit.cover),
  Image.asset('assets/Images/Yoga3.jpg',
      width: 380, height: 210, fit: BoxFit.cover),
  Image.asset('assets/Images/Yoga6.jpg',
      width: 380, height: 210, fit: BoxFit.cover),
  Image.asset('assets/Images/Yoga7.jpg',
      width: 380, height: 210, fit: BoxFit.cover),
  Image.asset('assets/Images/Yoga10.jpg',
      width: 380, height: 210, fit: BoxFit.cover),
];

class Video {
  Image image;
  String url;
  int duration;
  String workout_type;
  String difficulty;
  String description;

  Video(
      {required this.image,
      required this.url,
      required this.duration,
      required this.workout_type,
      required this.difficulty,
      required this.description});

  factory Video.fromJson(Map<String, dynamic> json, int index) {
    if (json['workout_type'] == "Hatha Yoga") {
      return Video(
        image: images[(index) % images.length],
        url: json['url'],
        duration: json['duration'],
        workout_type: "Хатха йога",
        difficulty: json['difficulty'],
        description:
            "Хатха-йога воздействует на костную и мышечную системы организма, укрепляя позвоночник, суставы и повышая эластичность мышц, а также нервную систему, укрепляя дух и помогая справляться с переживаниями. Неподвижные позы отлично прорабатывают все группы мышц и развивают статическую силу.",
      );
    }
    if (json['workout_type'] == "Wellness yoga") {
      return Video(
        image: images[(index) % images.length],
        url: json['url'],
        duration: json['duration'],
        workout_type: "Оздоровительная йога",
        difficulty: json['difficulty'],
        description:
            "Оздоровительная Йога — это инструмент, с помощью которого можно контролировать свое психофизическое состояние, не допуская вмешательства болезней и старости. Цель занятий — это профилактика, которая лучше и дешевле чем лечение и в человеческом и в экономическом плане. Все городские жители страдают от стресса.",
      );
    }
    if (json['workout_type'] == "Yoga nidra") {
      return Video(
        image: images[(index) % images.length],
        url: json['url'],
        duration: json['duration'],
        workout_type: "Йога нидра",
        difficulty: json['difficulty'],
        description:
            "Йога-нидра, или йогический сон, - это практика, которая одновременно является и практикой медитации, и медитативным состоянием. Ее можно рассматривать как динамический сон или сон с осознанием.",
      );
    }
    if (json['workout_type'] == "Fitness yoga") {
      return Video(
        image: images[(index) % images.length],
        url: json['url'],
        duration: json['duration'],
        workout_type: 'Фитнесс йога',
        difficulty: json['difficulty'],
        description:
            "Фитнес Йога — комплекс физических упражнений на растяжку, укрепление мышечного тонуса и улучшение состояния позвоночного столба, выполняемых в сочетании с дыхательной гимнастикой и практикой осознанной релаксации",
      );
    }

    if (json['workout_type'] == "Stretching yoga") {
      return Video(
        image: images[(index) % images.length],
        url: json['url'],
        duration: json['duration'],
        workout_type: 'Стретчинг йога',
        difficulty: json['difficulty'],
        description:
            "Стретч-йога существенно отличается от классического и традиционного стретчинга. Вы будете работать самостоятельно, прилагая усилия. Асаны глубоко разогревают, прорабатывают и гармонизируют ваше тело.В нашей школе мы объединили два направления в один вид тренинга. Цели и результаты занятий стретчингом — шпагаты, глубокие прогибы - можно достичь используя методы и приёмы классической йоги.",
      );
    }
    if (json['workout_type'] == "Sivananda yoga") {
      return Video(
        image: images[(index) % images.length],
        url: json['url'],
        duration: json['duration'],
        workout_type: "Шивананда йога",
        difficulty: json['difficulty'],
        description:
            "Шивананда йога – это путь к ментальному и физическому благополучию. Является более монашеским направлением с очень строгими традициями. Считается, что Шивананда йога имеет мощный терапевтический эффект и даже была основателем йога-терапии. Регулярные занятия помогут практикующим укрепить и сделать более гибким позвоночник, улучшить работу кровеносной, дыхательной, эндокринной систем организма, продлить молодость и сохранить здоровье.",
      );
    }
    if (json['workout_type'] == "Morning meditations") {
      return Video(
        image: images[(index) % images.length],
        url: json['url'],
        duration: json['duration'],
        workout_type: "Утренняя медитация",
        difficulty: json['difficulty'],
        description:
        "Утренняя медитация помогает начать день с ясным умом, создает позитивный настрой на предстоящий день, способствует ясности и сосредоточенности ума, снижает стресс и беспокойство, повышает чувство благополучия, повышает творческий потенциал, улучшает качество сна.",
      );
    }
    if (json['workout_type'] == "Night meditations") {
      return Video(
        image: images[(index) % images.length],
        url: json['url'],
        duration: json['duration'],
        workout_type: "Вечерняя медитация",
        difficulty: json['difficulty'],
        description:
        "Физически и эмоционально истощённые за день, мы нередко проваливаемся в сон ещё до того, как голова коснётся подушки. Или, наоборот, полночи ворочаемся, мучаясь от бессонницы — частой спутницы эмоциональных перегрузок. Ещё один знакомый многим сюжет — уснуть перед телевизором или со смартфоном в руках. Улучшить качество сна поможет вечерняя медитация. Она стимулирует выработку мелатонина в крови — гормона, обеспечивающего спокойный ночной отдых. Всего 15 минут практики помогут унять беспокойство, справиться с эмоциональным напряжением и настроиться на приятные сновидения.",
      );
    }
    if (json['workout_type'] == "Relax") {
      return Video(
        image: images[(index) % images.length],
        url: json['url'],
        duration: json['duration'],
        workout_type: "Расслабление",
        difficulty: json['difficulty'],
        description:
        "Расслабляющая медитация поможет прийти в себя после тяжелого рабочего дня, при перенапряжении и поможет восстановить внутренний баланс.",
      );
    }
    if (json['workout_type'] == "Affirmation") {
      return Video(
        image: images[(index) % images.length],
        url: json['url'],
        duration: json['duration'],
        workout_type: "Аффирмации",
        difficulty: json['difficulty'],
        description:
        "В популярной психологии аффирмация — это позитивное утверждение, краткая фраза самовнушения, создающая правильный психологический настрой.",
      );
    }
    if (json['workout_type'] == "Advanced meditations") {
      return Video(
        image: images[(index) % images.length],
        url: json['url'],
        duration: json['duration'],
        workout_type: "Медитации для продвинутых",
        difficulty: json['difficulty'],
        description:
        "Медитации для тех, кто познал себя и эту жизнь.",
      );
    }
    return Video(
      image: images[(index) % images.length],
      url: json['url'],
      duration: json['duration'],
      workout_type: "",
      difficulty: json['difficulty'],
      description: "",
    );
  }

  String getUrl() {
    return url;
  }

  int getDuration() {
    return duration;
  }

  String getWorkoutType() {
    return workout_type;
  }

  String getDifficulty() {
    return difficulty;
  }

  String getDescription() {
    return description;
  }

  Image getImage() {
    return image;
  }
}
