# Campus Event App - Flutter Application

<div align="center">
  <img src="https://lms.global.ac.id/lms/pluginfile.php/1/theme_klass/footerlogo/1745232397/logo-global-institute-stroke.png" alt="Institut Teknologi dan Bisnis Bina Sarana Global" width="200"/>
</div>

<div align="center">
Institut Teknologi dan Bisnis Bina Sarana Global <br>
FAKULTAS TEKNOLOGI INFORMASI & KOMUNIKASI 
<br>
https://global.ac.id/
</div>

## 📚 Project UAS
- **Mata Kuliah** : Aplikasi Mobile
- **Kelas** : TI 23 SE P2
- **Semester** : GANJIL 
- **Tahun Akademik** : 2025 - 2026

## About The Project

**Campus Event App** adalah aplikasi mobile modern yang dikembangkan menggunakan Flutter untuk membantu mahasiswa dan admin kampus dalam mengelola kegiatan dan event kampus. Aplikasi ini menyediakan antarmuka yang intuitif dengan fitur sinkronisasi cloud menggunakan Firebase Authentication, Firebase Cloud Messaging untuk notifikasi, dan Supabase sebagai backend database untuk penyimpanan data kegiatan.

Dengan Campus Event App, pengguna dapat dengan mudah melihat event kampus yang akan datang, mendapatkan notifikasi untuk event penting, serta bagi admin dapat menambah, mengedit, dan menghapus event dengan mudah.

### Key Features

- **Modern UI/UX Design** - Antarmuka yang clean dan user-friendly dengan splash screen yang menarik
- **Multi-Role System** - Sistem role Admin dan User dengan dashboard berbeda
- **Firebase Authentication** - Login dan registrasi aman dengan Firebase Auth
- **Push Notifications** - Notifikasi real-time menggunakan Firebase Cloud Messaging
- **Cloud Database** - Penyimpanan data event menggunakan Supabase
- **Event Management** - Admin dapat menambah, mengedit, dan menghapus event (CRUD)
- **Event Discovery** - User dapat melihat dan mencari event kampus
- **Team Profile** - Halaman profil lengkap untuk setiap anggota tim pengembang

## Screenshots

<div align="center">
  <img src="screenshots/splash_screen.png" alt="Splash Screen" width="200"/>
  <img src="screenshots/login_screen.png" alt="Login" width="200"/>
  <img src="screenshots/home_screen.png" alt="Home" width="200"/>
  <img src="screenshots/profile_screen.png" alt="Profile" width="200"/>
</div>

<div align="center">
  <img src="screenshots/admin_dashboard.png" alt="Admin Dashboard" width="200"/>
  <img src="screenshots/add_event.png" alt="Add Event" width="200"/>
  <img src="screenshots/event_detail.png" alt="Event Detail" width="200"/>
  <img src="screenshots/settings.png" alt="Settings" width="200"/>
</div>

## Demo Video

Lihat video demo aplikasi kami untuk melihat semua fitur dalam aksi!

**[Watch Full Demo on YouTube](soon)**

Alternative link: **[Google Drive Demo](soon)**

## Download APK

Download versi terbaru aplikasi Campus Event App:

### Latest Release v1.0.0
- [**Download APK**](soon)

**Minimum Requirements:**
- Android 6.0 (API level 23) or higher
- ~25MB free storage space

## Built With

- **[Flutter](https://flutter.dev/)** - UI Framework
- **[Dart](https://dart.dev/)** - Programming Language
- **[Firebase Auth](https://firebase.google.com/docs/auth)** - Authentication
- **[Firebase Cloud Messaging](https://firebase.google.com/docs/cloud-messaging)** - Push Notifications
- **[Supabase](https://supabase.com/)** - Backend Database
- **[flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications)** - Local Notifications
- **[heroicons](https://pub.dev/packages/heroicons)** - Icon Library

## Getting Started

### Prerequisites

Pastikan Anda sudah menginstall:
- Flutter SDK (3.16.0 or higher)
- Dart SDK (3.2.0 or higher)
- Android Studio / VS Code
- Git

### Installation

1. Clone repository
```bash
git clone https://github.com/Mansyahariii/collabsession_kelompok_3.git
cd collabsession_kelompok_3
```

2. Install dependencies
```bash
flutter pub get
```

3. Setup Firebase
```bash
# Download google-services.json dari Firebase Console
# Place in android/app/
cp path/to/google-services.json android/app/
```

4. Run aplikasi
```bash
flutter run
```

### Build APK

```bash
# Debug APK
flutter build apk --debug

# Release APK
flutter build apk --release

# Split APK by ABI
flutter build apk --split-per-abi
```

## 📁 Project Structure

```
lib/
├── main.dart                 # Entry point & Firebase/Supabase initialization
├── firebase_options.dart     # Firebase configuration
├── models/
│   └── activity.dart         # Activity/Event data model
├── pages/
│   ├── splashscreen1.dart    # Splash screen 1
│   ├── splashscreen2.dart    # Splash screen 2
│   ├── splashscreen3.dart    # Splash screen 3
│   ├── splashscreen4.dart    # Splash screen 4
│   ├── login.dart            # Login & Registration screen
│   ├── admin/
│   │   ├── admin_dashboard.dart    # Admin main dashboard
│   │   ├── admin_homepage.dart     # Admin home page
│   │   ├── add_event_page.dart     # Add new event
│   │   └── edit_event_page.dart    # Edit existing event
│   ├── user/
│   │   ├── user_dashboard.dart     # User main dashboard
│   │   └── user_homepage.dart      # User home page
│   ├── shared/
│   │   ├── event_page.dart         # Event listing page
│   │   ├── event_detail_page.dart  # Event detail view
│   │   ├── team_page.dart          # Team members listing
│   │   └── setting_page.dart       # Settings page
│   └── profile/
│       ├── detailprofile1.dart     # Ari Firmansyah profile
│       ├── detailprofile2.dart     # Mison Wenda profile
│       ├── detailprofile3.dart     # Rizky Adekatuasa profile
│       └── profilecendy.dart       # Cendy Alvianto profile
└── services/
    └── activity_service.dart  # Supabase activity CRUD service
```

## Authentication Flow

```
1. Splash Screen (4 onboarding screens)
   ↓
2. Login Screen / Register Screen (Firebase Auth)
   ↓
3. Role Check (Admin / User)
   ↓
4. Admin Dashboard / User Dashboard
   ↓
5. Event Management, Team Profile, Settings
```

## 🗄️ Database Schema

### Activities Table (Supabase)
```sql
CREATE TABLE activities (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title TEXT NOT NULL,
  description TEXT,
  date TIMESTAMPTZ NOT NULL,
  location TEXT NOT NULL,
  created_by UUID,
  created_at TIMESTAMPTZ DEFAULT NOW()
);
```

### Profiles Table (Supabase)
```sql
CREATE TABLE profiles (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  firebase_uid TEXT NOT NULL,
  name TEXT,
  role TEXT DEFAULT 'user',
  fcm_token TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);
```

## 📝 API Documentation

### Firebase Authentication
- `signInWithEmailAndPassword()` - Login user
- `createUserWithEmailAndPassword()` - Register user baru
- `signOut()` - Logout user

### Supabase Endpoints (Activity Service)
- `fetchActivities()` - Get all activities
- `addActivity(data)` - Add new activity
- `updateActivity(id, data)` - Update activity
- `deleteActivity(id)` - Delete activity

## Development Workflow

1. Fork repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

## Team Members & Contributions

### Development Team

| Name | NIM | Role | LinkedIn | Contributions |
|------|-----|------|----------|---------------|
| **Ari Firmansyah** | 1123150127 | Project Lead & UI/UX Designer | [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ari-firmansyah-7ab3693a5/) | - Splash screen design<br>- UI/UX Design<br>- Profile page implementation<br>- Project structure |
| **Rizky Adekatuasa** | 1123150137 | Mobile Developer | [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?logo=linkedin&logoColor=white)](https://www.linkedin.com/in/rizky-adekatuasa-23336a3a5/) | - Login & Registration screen<br>- Firebase Authentication<br>- Push notification (FCM)<br>- Local notifications |
| **Cendy Alvianto** | 1123150136 | Full Stack Developer | [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?logo=linkedin&logoColor=white)](https://www.linkedin.com/in/cendy-alvianto-609b5432b/) | - Admin dashboard<br>- Event management (CRUD)<br>- Supabase integration<br>- Activity service |
| **Mison Wenda** | 1123150103 | Backend Developer | [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?logo=linkedin&logoColor=white)](https://www.linkedin.com/in/mison-wenda-76ba7438b/) | - User dashboard<br>- Event detail page<br>- Team page<br>- Settings page |

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Flutter Community](https://flutter.dev/community) - For amazing packages
- [Firebase](https://firebase.google.com/) - For authentication & messaging services
- [Supabase](https://supabase.com/) - For backend database
- [Heroicons](https://heroicons.com/) - For beautiful icons

---

<div align="center">
  <p>Made with Spirit by Kelumpuk 3 Team</p>
  <p>© 2026 Campus Event App. All rights reserved.</p>
</div>