# doc_book

A Flutter app that explores the doctors. This project demonstrates clean architecture, efficient state management, API integration, and polished UI/UX.

## App Screenshots


| Profile | Booking | Messaging | Settings/Support | Authentication | General |
|:--------|:--------|:----------|:-----------------|:--------------|:--------|
| ![About Me](https://github.com/user-attachments/assets/1ee09c55-3b2c-4a6f-aa9c-9891e470a451)<br>![Address](https://github.com/user-attachments/assets/4c62a5ab-1e86-49e0-aac5-e7cd6e8bee89)<br>![Medical Record](https://github.com/user-attachments/assets/80ba175c-7cea-4943-8ebf-e9f2fe85d359) | ![Booking Details](https://github.com/user-attachments/assets/1f8d4c16-d038-4395-b3d9-f4b0e103e705)<br>![Cancelled](https://github.com/user-attachments/assets/bdaaf32b-e651-4dfc-bb82-9b31b981791c)<br>![Completed](https://github.com/user-attachments/assets/0ccdda31-9055-4362-8b3a-e69f364c3aa2)<br>![Date & Time](https://github.com/user-attachments/assets/5765612c-be97-4f76-8bb4-9a98d00acaa0)<br>![Doctor Speciality Screen](https://github.com/user-attachments/assets/e6690fe2-ef6e-4525-bae7-6c374864c491) | ![Conversation](https://github.com/user-attachments/assets/fdbacf44-733d-4882-9770-23c3b1ab2de5)<br>![Inbox](https://github.com/user-attachments/assets/b1d3afb3-ed76-4a19-834b-fbb72449c543) | ![FAQ Screen](https://github.com/user-attachments/assets/6d202ab4-9d01-43b8-973b-a7c2d00426a6)<br>![Language Screen](https://github.com/user-attachments/assets/053c9b40-7548-4b32-8701-1f43013625a1)<br>![Notification Screen](https://github.com/user-attachments/assets/447c4e3d-e43f-4365-8730-54fb775ce3e8) | ![Forgot Password](https://github.com/user-attachments/assets/34c297c2-5347-4dd1-a3f1-4af6ff4483b7) | ![Homepage](https://github.com/user-attachments/assets/0296def9-10bf-4bf5-b700-c9b25613a89f)<br>![Onboarding](https://github.com/user-attachments/assets/b812f2f9-0e1b-49e3-8830-10413951c6ce) |

# Feature
- Doctors List:
  - Display doctor avatars, names, specialties, location, and statuses.
  - Infinite scrolling to fetch more characters as you scroll.
- Search and Filter:
  - Search for Doctors by name.
  - Filter Doctors by specialties.
- Doctor Appointment:
  - Book an appointment.
  - View all your appointments.
  - View the status of your appointment.
- Doctor Details:
  - View detailed information about a Doctor, including:
  - Name, status, specialty, location, rate, book price.
- Your Appointment:
  - View all books.
  - View all patients.
- Chat:
  - The doctor can chat with the patient.
- Error Handling:
  - Display appropriate error messages for issues like network errors or no search results.

# Packages Used
| Category          | Package                          | Purpose                                    |
|:------------------|:---------------------------------|:-------------------------------------------|
| Networking        | dio- Retrofit                    | For making API requests.                   |
| State Management  | flutter_bloc                     | For managing app state efficiently.        |
| Persistence       | shared_preferences               | To save token .                            |
| UI/UX             | flutter_screenutil, flutter_svg  | For responsive UI and SVG handling.        |
| Utilities         | infinite_scroll_pagination, fluttertoast | For pagination and user notifications. |
| error             | frezeed - json_seralizable       | error handling and cubit states            |
| splash            | flutter_native_splash            | To crate splash screen                     |
| navigation        | Go_router                        | control navigation in app                  |
| Other             | get_it                           | Dependency injection .                     |

# Clean Architecture 
- Contains shared functionality used across the app.
  - Constants: App-wide constant values.
  - Helpers: Utility functions and extensions.
  - Local Storage: Local persistence using shared_preferences.
  - Models: Core data models.
  - Network: API client setup with Dio and Retrofit.
  - Routes: App navigation routes.
  - Utils: Common utilities.
  - Widgets: Reusable UI components.
  
# Features:
Each feature is implemented in a modular folder structure.

- Data Layer:
  - Remote Data Source: Handles API calls via Retrofit.
  - Repository Implementation: Implements repository interfaces.
  - Models: get the Api response as a Dart object.
- Domain Layer:
  - Repository Interface: Defines contracts for the data layer.
  - Use Case: Encapsulates application-specific business logic.
- Presentation Layer:
  - UI screens and state management using flutter_bloc.
 
# Focus Areas
While building this app, I emphasized the following software development principles and best practices:

- Performance Bottlenecks: Ensured smooth scrolling, fast data loading, and efficient API calls.
- Maintainability Concerns: Structured the project for long-term maintainability with clean architecture.
- Readability Challenges: Used clear naming conventions and concise code for better readability.
- Object-Oriented Programming (OOP): Followed OOP principles to create modular, reusable components.
- Data Structures & Algorithms (DSA): Applied efficient data structures and algorithms for features like searching and filtering.
- SOLID Principles: Ensured the app adheres to SOLID principles for robust and flexible design.
- Design Patterns: Utilized design patterns like Singleton (e.g., GetIt for dependency injection).
- Clean Code: Wrote well-documented, readable, and maintainable code.
- Code Smells: Regularly refactored code to eliminate code smells and improve quality.

# System Design
```
lib/
├── core/
│   ├── constants/
│   ├── helpers/
│   ├── local_storage/
│   ├── models/
│   ├── network/
│   ├── routes/
│   ├── utils/
│   └── widgets/
├── features/
│   ├── feature_name/
│   │   ├── data/
│   │   │   ├── remote_data_source.dart
│   │   │   └── repository_implementation.dart
│   │   ├── domain/
│   │   │   ├── repository.dart
│   │   │   └── use_cases/
│   │   └── presentation/
│   │       ├── bloc/
│   │       ├── screens/
│   │       └── widgets/
│   └── ...
└── main.dart
```
