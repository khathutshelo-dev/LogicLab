import 'package:flutter/material.dart';

void main() {
  runApp(YouCaptionsApp());
}

class YouCaptionsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouCaptions',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: CategoriesScreen(),
    );
  }
}

class CategoriesScreen extends StatelessWidget {
  final List<String> categories = [
    'Inspirational Quotes',
    'Humorous Captions',
    'Travel & Adventure',
    'Love & Relationships',
    'Self-Care & Wellness'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        title: Text('YouCaptions'),
        backgroundColor: Colors.pink,
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.pink[200],
            child: ListTile(
              title: Text(
                categories[index],
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CaptionsScreen(category: categories[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class CaptionsScreen extends StatelessWidget {
  final String category;

  CaptionsScreen({required this.category});

  final Map<String, List<String>> captions = {
    'Inspirational Quotes': [
      "Dream big, hustle harder.",
      "Stars can’t shine without darkness.",
      "Grounded, but reaching for the skies.",
      "Success is born where comfort dies.",
      "Bloom where you’re planted.",
      "The comeback is always stronger than the setback.",
      "Don't just exist; live to inspire.",
      "Keep your head high, and your ambitions higher.",
      "Elevate your hustle, not your ego.",
      "Rise by lifting others.",
      "The best view comes after the hardest climb.",
      "Stay humble, but let them know you're in the room.",
      "Keep going; the best is yet to come.",
      "Chasing dreams, catching success.",
      "Be fearless in the pursuit of what sets your soul on fire.",
      "Turn your can'ts into cans and your dreams into plans.",
      "Success tastes sweeter after a little struggle.",
      "No limits, just endless possibilities.",
      "Fuel your passion, ignite your future.",
      "Level up, then top that level."
    ],
    'Humorous Captions': [
      "I speak fluent sarcasm and movie quotes.",
      "Don’t grow up, it’s a trap.",
      "I’m on energy-saving mode.",
      "Why fall in love when you can fall asleep?",
      "I put the 'Pro' in procrastination.",
      "I don’t sweat, I sparkle.",
      "Running late is my cardio.",
      "Brains are awesome. I wish everyone had one.",
      "I’m not lazy, I’m just on power-saving mode.",
      "I’m not arguing, I’m just explaining why I’m right.",
      "Friday is my second favorite F-word.",
      "Life is short—buy the shoes.",
      "Coffee: because adulting is hard.",
      "I’m multitasking: I can listen, ignore, and forget at the same time.",
      "I don’t always take selfies, but when I do, I like them.",
      "I tried to be normal once. Worst two minutes of my life.",
      "If we were meant to stay in one place, we’d have roots instead of feet.",
      "I’m not short; I’m fun-sized.",
      "If I was funny, I’d have a better caption.",
      "I need six months of vacation, twice a year."
    ],
    'Travel & Adventure': [
      "Lost in the right direction.",
      "Take only pictures, leave only footprints.",
      "Catch flights, not feelings.",
      "Adventure is out there—go find it!",
      "Go where you feel most alive.",
      "Life’s a journey—make it epic.",
      "The world is big; let’s explore.",
      "Leave the road, take the trails.",
      "Take me where the Wi-Fi is weak, and the sun is strong.",
      "Let's find some beautiful places to get lost.",
      "Jet lag is for amateurs.",
      "To travel is to live.",
      "Life was meant for good friends and great adventures.",
      "Exploring the world one passport stamp at a time.",
      "Wherever you go, go with all your heart.",
      "Collecting memories, one destination at a time.",
      "Always take the scenic route.",
      "Travel far enough to find yourself.",
      "Escape the ordinary.",
      "Let's wander where the Wi-Fi is weak."
    ],
    'Love & Relationships': [
      "You’re my person, forever and always.",
      "Every love story is beautiful, but ours is my favorite.",
      "We go together like coffee and mornings.",
      "Love you to the moon and back.",
      "In a sea of people, my eyes will always search for you.",
      "With you, every moment is a fairytale.",
      "You had me at 'hello.'",
      "Together is my favorite place to be.",
      "Our hearts beat in sync.",
      "Love brought us together; destiny keeps us that way.",
      "You make my heart smile.",
      "We are better together.",
      "You stole my heart, but I’ll let you keep it.",
      "We’re a perfect match, just like puzzle pieces.",
      "Love is not about how many days, weeks, or months you’ve been together—it’s about how much you love each other every day.",
      "You’re the peanut butter to my jelly.",
      "I want all of my lasts to be with you.",
      "Falling for you every single day.",
      "Together, we’re unstoppable.",
      "You complete me in ways I didn’t even know I needed."
    ],
    'Self-Care & Wellness': [
      "Self-care isn’t selfish—it’s survival.",
      "Nourish your soul.",
      "Mindset is everything.",
      "Relax, refresh, recharge.",
      "Let your vibe attract your tribe.",
      "Your energy introduces you before you even speak.",
      "Invest in yourself—mind, body, soul.",
      "Progress over perfection.",
      "Radiate positivity, attract happiness.",
      "Be your own kind of beautiful.",
      "Take a deep breath and start again.",
      "Create a life you don’t need a vacation from.",
      "Your only limit is you.",
      "Embrace the pace of your own journey.",
      "Find joy in the little things.",
      "Strive for progress, not perfection.",
      "Take time to make your soul happy.",
      "Let go of what you can’t change and focus on what you can.",
      "You are enough, just as you are.",
      "Fill your cup first, then pour into others."
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        title: Text(category),
        backgroundColor: Colors.pink,
      ),
      body: ListView.builder(
        itemCount: captions[category]!.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.pink[200],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                captions[category]![index],
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}