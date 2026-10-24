import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // TODO 1: Deklarasikan variabel
  bool isSignedIn = false;
  String fullName = '';
  String userName = '';
  int favoriteCandiCount = 0;

  @override
  Widget build(BuildContext context) {
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
                        if (isSignedIn)
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
                        value: userName,
                        iconColor: Colors.amber,
                      ),

                      const SizedBox(height: 12),
                      Divider(color: Colors.deepPurple[100]),
                      const SizedBox(height: 12),

                      ProfileInfoItem(
                        icon: Icons.person,
                        label: 'Nama',
                        value: fullName,
                        showEditIcon: isSignedIn,
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
                        value: favoriteCandiCount > 0
                            ? '$favoriteCandiCount'
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

                isSignedIn
                    ? TextButton(
                  onPressed: signOut,
                  child: const Text('Sign Out'),
                )
                    : TextButton(
                  onPressed: signIn,
                  child: const Text('Sign In'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // TODO 5: Implementasi fungsi signIn
  void signIn() {
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  // TODO 6: Implementasi fungsi signOut
  void signOut() {
    setState(() {
      isSignedIn = !isSignedIn;
    });
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