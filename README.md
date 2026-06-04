# Adaptive IoT Dashboard - Flutter UI Lab

A responsive Flutter application that demonstrates how to build adaptive layouts capable of scaling seamlessly between portrait (mobile) and landscape (tablet/desktop) orientations. 

This project explores the use of constraints and dynamic widget trees to create a unified user experience without duplicating code, themed as a Smart Home / IoT monitoring interface.

---

## 🚀 Features

* **Responsive Architecture:** Utilizes Flutter's `LayoutBuilder` to detect available screen width and adjust the UI structure dynamically.
* **Mobile View (Portrait):** When the screen width is less than 600px, the application uses a standard `AppBar` with a hidden `Drawer` for navigation to maximize vertical space for content.
* **Tablet/Desktop View (Landscape):** When the screen width exceeds 600px, the navigation menu locks to the left side as a fixed panel, and the main content expands to fill the remaining horizontal space.
* **Material 3 Theming:** Implements a modern aesthetic using a custom color palette (Olive Green and Grey) integrated via `ColorScheme.fromSeed`.
* **Reusable Components:** Extracts the `NavigationMenu` and `MainContentArea` into stateless widgets, allowing them to be shared perfectly between the drawer and the side panel without code repetition.

---

## 📁 Project Structure

```text
lib/
└── main.dart    # Contains the entire application logic, routing, and UI


Key Classes
AdaptiveDashboardApp: The root widget setting up the Material theme.

ResponsiveLayoutScreen: The core layout engine containing the LayoutBuilder logic (the 600px breakpoint).

NavigationMenu: The shared menu widget used in both the Drawer and the Side Panel.

MainContentArea: The primary dashboard interface containing the status header and node list.

🛠️ Getting Started
Prerequisites
Flutter SDK (Version 3.0 or higher recommended)

An IDE (VS Code, Android Studio, or IntelliJ) with Flutter extensions installed.

Installation & Execution
Create a new project:

Bash
flutter create adaptive_dashboard
cd adaptive_dashboard
Add the code:
Replace the contents of your lib/main.dart file with the provided code.

Run the app:

flutter run

Testing the Adaptive Layout
To see the responsive design in action:

Emulator/Simulator: Rotate your virtual device between portrait and landscape modes.

Desktop/Web: Launch the app as a macOS/Windows/Web application and physically resize the application window back and forth across the 600px threshold.

💡 Concepts Covered
LayoutBuilder and BoxConstraints

Conditional rendering based on screen size

Widget extraction and reusability

Drawer and fixed Row navigation patterns

![alt text](<Screenshot 2026-06-05 025931.png>) ![alt text](<Screenshot 2026-06-05 025939.png>)