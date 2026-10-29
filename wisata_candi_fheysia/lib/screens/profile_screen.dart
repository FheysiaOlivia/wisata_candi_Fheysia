import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../providers/favorite_provider.dart';
import 'sign_in_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil data dari Provider
    final auth = context.watch<AuthProvider>();
    final favoriteCount = context.watch<FavoriteProvider>().count;

    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                // TODO 2: ProfileHeader
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.deepPurple,
                              width: 2,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                              'images/placeholder_image.png',
                            ),
                          ),
                        ),

                        if (auth.isSignedIn)
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.deepPurple[50],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // TODO 3: ProfileInfo
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      ProfileInfoItem(
                        icon: Icons.lock,
                        label: 'Pengguna',
                        value: auth.username,
                        iconColor: Colors.amber,
                      ),

                      const SizedBox(height: 12),
                      Divider(color: Colors.deepPurple[100]),
                      const SizedBox(height: 12),

                      ProfileInfoItem(
                        icon: Icons.person,
                        label: 'Nama',
                        value: auth.username,
                        showEditIcon: auth.isSignedIn,
                        onEditPressed: () {
                          debugPrint('Icon edit ditekan');
                        },
                        iconColor: Colors.blue,
                      ),

                      const SizedBox(height: 12),
                      Divider(color: Colors.deepPurple[100]),
                      const SizedBox(height: 12),

                      ProfileInfoItem(
                        icon: Icons.favorite,
                        label: 'Favorit',
                        value: favoriteCount > 0
                            ? '$favoriteCount'
                            : '',
                        iconColor: Colors.red,
                      ),
                    ],
                  ),
                ),

                // TODO 4: ProfileActions
                const SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                const SizedBox(height: 20),

                auth.isSignedIn
                    ? TextButton(
                  onPressed: () {
                    context.read<AuthProvider>().signOut();
                  },
                  child: const Text('Sign Out'),
                )
                    : TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SignInScreen(),
                      ),
                    );
                  },
                  child: const Text('Sign In'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget untuk setiap baris informasi
class ProfileInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool showEditIcon;
  final VoidCallback? onEditPressed;
  final Color iconColor;

  const ProfileInfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.showEditIcon = false,
    this.onEditPressed,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          child: Row(
            children: [
              Icon(icon, color: iconColor),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: Text(
            ': $value',
            style: const TextStyle(fontSize: 18),
            overflow: TextOverflow.ellipsis,
          ),
        ),

        if (showEditIcon)
          InkWell(
            onTap: onEditPressed,
            child: const Icon(Icons.edit),
          ),
      ],
    );
  }
}