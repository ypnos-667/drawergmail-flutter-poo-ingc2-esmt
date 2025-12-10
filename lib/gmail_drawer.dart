import 'package:flutter/material.dart';

class GmailDrawer extends StatelessWidget {
  const GmailDrawer({super.key});

  static const Color gmailRed = Color(0xFFD93025);
  static const Color iconGrey = Color(0xFF5F6368);
  static const Color textPrimary = Color(0xFF202124);
  static const Color textSecondary = Color(0xFF5F6368);
  static const Color dividerGrey = Color(0xFFE0E0E0);
  static const Color badgeGrey = Color(0xFF3C4043);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300,
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          SizedBox(
            height: 100,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(color: dividerGrey, width: 0.5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Gmail",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: gmailRed,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "blablabla@gmail.com",
                        style: TextStyle(fontSize: 14, color: textSecondary),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.search, color: iconGrey),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),

          _buildSectionHeader("Toutes les boîtes"),
          _buildMenuItem(title: "Toutes les boîtes", icon: Icons.all_inbox),
          _buildMenuItem(
            title: "Principale",
            icon: Icons.inbox,
            badgeCount: 345,
          ),
          _buildMenuItem(title: "Promotions", icon: Icons.local_offer),
          _buildMenuItem(
            title: "Réseaux sociaux",
            icon: Icons.people,
            badgeText: "+99",
          ),
          _buildMenuItem(title: "Notifications", icon: Icons.notifications),

          const Divider(height: 20, thickness: 0.5, color: dividerGrey),

          _buildSectionHeader("Tous les libellés"),
          _buildMenuItem(title: "Messages suivis", icon: Icons.label_important),
          _buildMenuItem(title: "En attente", icon: Icons.access_time),
          _buildMenuItem(
            title: "Important",
            icon: Icons.star_border,
            badgeCount: 45,
          ),
          _buildMenuItem(title: "Achats", icon: Icons.shopping_cart),
          _buildMenuItem(title: "Envoyés", icon: Icons.send),
          _buildMenuItem(title: "Planifié", icon: Icons.schedule),
          _buildMenuItem(title: "Boîte d'envoi", icon: Icons.outbox),
          _buildMenuItem(title: "Brouillons", icon: Icons.drafts),
          _buildMenuItem(title: "Spam", icon: Icons.report_gmailerrorred),
          _buildMenuItem(title: "Corbeille", icon: Icons.delete_outline),

          const Divider(height: 20, thickness: 0.5, color: dividerGrey),

          _buildMenuItem(
            title: "Gérer les abonnements",
            icon: Icons.subscriptions,
          ),

          _buildSectionHeader("Applications Google"),
          _buildMenuItem(title: "Agenda", icon: Icons.calendar_today),
          _buildMenuItem(title: "Contacts", icon: Icons.contacts),

          const Divider(height: 20, thickness: 0.5, color: dividerGrey),

          _buildMenuItem(title: "Paramètres", icon: Icons.settings),
          _buildMenuItem(
            title: "Aide et commentaires",
            icon: Icons.help_outline,
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 20, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: textSecondary,
          letterSpacing: 0.4,
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required String title,
    required IconData icon,
    bool hasCheckbox = false,
    bool isChecked = false,
    int? badgeCount,
    String? badgeText,
    VoidCallback? onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      minLeadingWidth: 40,
      leading: SizedBox(
        width: 40,
        child: Row(
          children: [
            if (hasCheckbox)
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Checkbox(
                  value: isChecked,
                  onChanged: (value) {},
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                ),
              ),
            Icon(icon, size: 20, color: iconGrey),
          ],
        ),
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 14, color: textPrimary),
            ),
          ),
          if (badgeCount != null || badgeText != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: badgeGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                badgeText ?? badgeCount.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
      onTap: onTap ?? () {},
    );
  }
}
