import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aventeds/res/components/app_color.dart';
import 'package:aventeds/res/components/custom_app_bar.dart';
import 'package:aventeds/utils/routes/responsive.dart';
import 'package:aventeds/widgets/custom_bottom_navigation.dart';
import 'package:aventeds/widgets/custom_searchfield.dart';
import 'package:aventeds/widgets/custom_selectable.dart';
import 'package:aventeds/widgets/custom_video_player.dart';
import 'package:aventeds/widgets/custom_event_card.dart';
import 'package:aventeds/widgets/custom_upcoming_event_card.dart';

class HomeScreenView extends StatefulWidget {
  HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  int _currentIndex = 0;
  String _selectedTab = 'Greetings'; // Default selected tab

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Column(
              children: [
                // Top Section with Profile, Notifications, and Menu
                CustomAppBar(
                  notificationCount: 3,
                  profileImagePath: 'assets/images/profile.png',
                  onProfileTap: () {
                    // Handle profile tap
                  },
                  onNotificationTap: () {
                    // Handle notification tap
                  },
                  onMenuTap: () {
                    // Handle menu tap
                  },
                ),
                SizedBox(height: Responsive.h(5)),

                // Video Player Section
                _buildVideoPlayer(),
                SizedBox(height: Responsive.h(3)),

                // Search Bar
                _buildSearchBar(),
                SizedBox(height: Responsive.h(3)),

                // Navigation Tabs
                _buildNavigationTabs(),
                SizedBox(height: Responsive.h(2)),

                // Events Section
                _buildEventsSection(),
                SizedBox(height: Responsive.h(4)),

                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Upcoming Event',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColor.tertiaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset('assets/icons/left_arrow.svg'),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset('assets/icons/right_arrow.svg'),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                CustomSearchField(controller: TextEditingController()),
                SizedBox(height: 10),

                SizedBox(
                  height: 300,
                  width: double.infinity,

                  child: PageView.builder(
                    itemCount: 5, // or any number of cards you have
                    itemBuilder: (context, index) {
                      return CustomUpcomingEventCard(
                        title: 'Lorem Ipsum Dorem',
                        speakerName: 'Ronakd McMuffin',
                        timeSlot: '10.30 AM - 11.30 AM',
                        tags: ['Motion', 'no-code'],
                        speakerImagePaths: [
                          'assets/images/speaker1.png',
                          'assets/images/speaker2.png',
                          'assets/images/speaker3.png',
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          // Add navigation logic or show different content based on tab
          switch (index) {
            case 0:
              // Home tab selected
              print("Home tab selected");
              break;
            case 1:
              // Sponsor tab selected
              print("Sponsor tab selected");
              break;
            case 2:
              // Events tab selected
              print("Events tab selected");
              break;
          }
        },
      ),
    );
  }

  Widget _buildVideoPlayer() {
    return CustomVideoPlayer(
      videoUrl:
          'https://sample-videos.com/zip/10/mp4/SampleVideo_1280x720_1mb.mp4',
    );
  }

  Widget _buildSearchBar() {
    return CustomSearchField(controller: TextEditingController());
  }

  Widget _buildNavigationTabs() {
    return Row(
      children: [
        Expanded(child: _buildTab('Agenda')),
        SizedBox(width: Responsive.w(2)),
        Expanded(child: _buildTab('Greetings')),
        SizedBox(width: Responsive.w(2)),
        Expanded(child: _buildTab('Feedback')),
        SizedBox(width: Responsive.w(2)),
        Expanded(child: _buildTab('FAQs')),
      ],
    );
  }

  Widget _buildTab(String title) {
    return CustomSelectableTag(
      title: title,
      isSelected: _selectedTab == title,
      onTap: () {
        setState(() {
          _selectedTab = title;
        });
        // Handle tab selection logic here
        print('Selected tab: $title');
      },
    );
  }

  Widget _buildEventsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'You have ',
                style: GoogleFonts.poppins(
                  color: AppColor.tertiaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: '4',
                style: GoogleFonts.poppins(
                  color: Colors.yellow, // Make 4 yellow
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: ' Events today',
                style: GoogleFonts.poppins(
                  color: AppColor.tertiaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: Responsive.h(2)),
        SizedBox(
          height: Responsive.h(27),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CustomEventCard(
                title: 'Leadership\nSummit',
                date: 'Wed, 08 Mar',
                imagePath: 'assets/images/keynote.png',
                speakerImagePaths: [
                  'assets/images/speaker1.png',
                  'assets/images/speaker2.png',
                  'assets/images/speaker3.png',
                ],
                onTap: () {
                  // Handle event card tap
                },
              ),
              SizedBox(width: Responsive.w(3)),
              CustomEventCard(
                title: 'Keynote\nSession',
                date: 'Wed, 08 Mar',
                imagePath: 'assets/images/leadership.png',
                speakerImagePaths: [
                  'assets/images/speaker1.png',
                  'assets/images/speaker2.png',
                  'assets/images/speaker3.png',
                ],
                onTap: () {
                  // Handle event card tap
                },
              ),
              SizedBox(width: Responsive.w(3)),
              CustomEventCard(
                title: 'Lead\n Summit',
                date: 'Wed, 08 Mar',
                imagePath: 'assets/images/leadershp_summit.png',
                speakerImagePaths: [
                  'assets/images/speaker1.png',
                  'assets/images/speaker2.png',
                  'assets/images/speaker3.png',
                ],
                onTap: () {
                  // Handle event card tap
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
