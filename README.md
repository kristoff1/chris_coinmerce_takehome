# 📱 Coin List App

A cross-platform Flutter application that displays a list of coins and their current prices using CoinGecko API.

---

## 🚀 How to Run the App

Make sure you have Flutter installed. Then run:

```bash
flutter pub get
flutter run
```

You can specify a device or emulator if multiple are available.

---

## 🏁 How to Run in Release Mode

To run the app in release mode:

```bash
flutter run --release
```

---

## 🛠️ How to Build

To build the release APK:

```bash
flutter build apk --release
```

To build for iOS (on macOS only):

```bash
flutter build ios --release
```

---

## ✅ How to Run Tests

Run the specific unit test:

```bash
flutter test test/pages/coin_page/coin_page_view_model_test.dart
```

---

## 📚 Libraries Included

- `intl` – For internationalization and formatting
- `cached_network_image` – For efficient image caching
- `connectivity_plus` – For network connectivity status
- `rxdart` – For reactive programming
- `http` – For making REST API calls

---

## 🧠 State Management

We use **rxdart** for managing state reactively with streams and subjects.

---

## 🧩 Important Widgets

- `AncestorWidget` – A top-level widget that handles theme changes and contains all globally accessible objects like services.
- `CoinListItem` – Custom UI representation of a coin in the list.
- `CoinImageL` – A `CachedNetworkImage` widget wrapped in a `Hero` to transition the coin image to the detail page using the coin ID.
- `ConnectivityIndicator` – Displays the current network state to the user.
- `CoinSearchBar` – Allows filtering of coins by name.

---

## 🌐 Network API

All network requests use the `http` package. API endpoints:

- **List of coins**:  
  `https://api.coingecko.com/api/v3/coins/markets`
- **Price charts**:  
  `https://api.coingecko.com/api/v3/coins/{id}/market_chart`

---

## 🧰 Services

- `CoinSearchService` – Handles fetching of coin lists and price chart data from the CoinGecko API.

---

## ⚙️ Functionalities

- View a list of coins and their prices provided by CoinGecko.
- Pull-to-refresh on the list to get the latest price data.
- Tap on a coin to view a detailed page including price charts.

---

## 📎 Notes

- Compatible with Android and iOS
- Built with Flutter version: 3.29.3

---
