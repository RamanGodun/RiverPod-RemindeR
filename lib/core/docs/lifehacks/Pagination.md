# 📦 Riverpod Pagination Guide (Numbered & Infinite Scrolling)

This guide provides an overview of implementing **pagination** using **Riverpod**, 
covering both **infinite scrolling** and **numbered pagination** strategies.

---

## 🚀 Pagination Strategies

### 1. **Numbered Pagination**
- User navigates between pages using an explicit paginator (e.g. buttons or tabs).
- Useful for large datasets and precise navigation (e.g. `Go to page 5`).

### 2. **Infinite Scrolling**
- Loads data dynamically as the user scrolls near the bottom.
- Ideal for smooth, seamless user experience where manual pagination is unnecessary.

---

## 📂 Architecture Overview

- **Dio** handles HTTP requests (via `dioProvider`).
- **Repository layer** abstracts API logic and transforms responses into domain models.
- **Riverpod Providers** manage state and data fetching.
- **UI Pages** (e.g. `ProductsPageWithPagination`, `ProductsPageWithNumberPagination`) use providers to render paginated data.

---

## 🔁 Infinite Scrolling with `infinite_scroll_pagination`

### ✅ Core Concept

- Uses `PagingController<int, Product>` to control loading and pagination logic.
- `getNextPageKey` determines the next page.
- `fetchPage` triggers API call via Riverpod-powered repository.

### ✅ Key Components:
- `PagingListener` for pagination events.
- `PagedListView` to render items.
- Error, loading, and "no more data" indicators are customizable.

### ✅ Provider Logic
- Repository: `forPageWithInfiniteScrollPaginationProductsRepository`
- Provider fetches each page: `getProducts(page)`
- Page details handled by: `forPageWithInfiniteScrollPaginationGetProductProvider`

### ✅ Example Feature:
- Manual refresh with `RefreshIndicator`
- Navigation to product details using `ProductPageWithInfiniteScrollPagination`

---

## 🔢 Numbered Pagination with `number_paginator`

### ✅ Core Concept
- Renders a paginator that allows users to jump to a specific page.
- Keeps the logic simple: one page = one fetch.

### ✅ Key Providers:
- `forPageWithNumberPaginationGetProductsProvider(page)` fetches list of products for given page.
- Product details loaded using `ProductPageWithNumberPagination`.

### ✅ State Management
- Uses `int page = 1` with `setState()` to manage selected page.
- Fetches new data from provider when page changes.
- Pagination metadata (e.g. `totalPages`, `totalProducts`) is dynamically updated in the repository.

### ✅ Keep-Alive Logic
- Uses `ref.keepAlive()` and `ref.onCancel()` + `Timer()` to delay disposal and allow for caching.

---

## ⚙️ Repository Pattern for Pagination

Both strategies rely on an abstracted **Repository Layer**:

```dart
Future<List<Product>> getProducts(int page) async {
  final response = await dio.get('/products', queryParameters: {
    'limit': limit,
    'skip': (page - 1) * limit,
  });
  return response.data['products']
      .map<Product>((json) => Product.fromJson(json))
      .toList();
}
```

- Keeps networking concerns separate.
- Updates pagination metadata (e.g., total count).
- Exposes clean API to providers.

---

## 🧠 Best Practices

| Practice                      | Description                                                           |
|-------------------------------|-----------------------------------------------------------------------|
| `autoDispose` + `keepAlive()` | Avoids memory leaks while enabling smooth UX with cached data         |
| Cancel tokens                 | Prevents unnecessary API calls when navigating fast between pages     |
| Error handling                | Always provide UI fallback for error states                           |
| Separation of concerns        | Keep pagination logic out of the UI and inside repositories/providers |
| Preloading strategy           | Consider fetching the next page in advance for smoother UX            |

---

## ✅ Summary

- Choose **Infinite Scrolling** for modern, fluid UIs.
- Use **Numbered Pagination** for more structured and controlled navigation.
- Leverage Riverpod providers for caching, refresh, and error handling.
- Keep logic clean using repository pattern + Dio.
- Wrap pagination logic inside state-aware components with full Riverpod integration.

> Riverpod + Pagination = smooth, reactive, testable architecture for large data sets.