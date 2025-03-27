
## 2️⃣ **`skipLoadingOnRefresh` Behavior & Recommendations**

### **What is `skipLoadingOnRefresh`?**
`skipLoadingOnRefresh` is an optional parameter in `.when()` that controls whether the loading indicator should be displayed **when refreshing** the provider (e.g., via `ref.refresh()` or `invalidate`).

---

### ✅ **`skipLoadingOnRefresh: false`**

#### **Effect:**
- Shows **loading indicator** every time a refresh is triggered (even if old data is present).

#### **Recommended When:**
- Refresh is triggered **via AppBar button** or manual control.
- You want the user to be explicitly informed that fresh data is being fetched.
- Consistent UX: clear visual feedback.

---

### ✅ **`skipLoadingOnRefresh: true`**

#### **Effect:**
- **Old data is displayed** while the new request is in progress.
- No loading indicator shown during refresh.

#### **Recommended When:**
- Used with **`RefreshIndicator`** (pull-to-refresh pattern).
- Preferred seamless UX: data remains visible, subtle refresh in background.
- Prevents unnecessary flicker of loading spinners when refreshing frequently.

---

## 🔥 **Summary Table:**

| Syntax                             | Advantages                                 | Use Case                                      |
|------------------------------------|--------------------------------------------|-----------------------------------------------|
| `.when()`                          | Explicit, easy control, `skipLoadingOnRefresh` support | Clear structure, more verbose UI trees        |
| `switch` (Pattern Matching)        | Concise, modern Dart, clean UI declarations | Compact widgets, experienced developers       |

| `skipLoadingOnRefresh` Option | Behavior                                                    | Best Scenario                                     |
|----------------------------|-------------------------------------------------------------|---------------------------------------------------|
| `false`                    | Shows loading indicator on each refresh                      | AppBar button refresh, explicit UX                |
| `true`                     | Keeps previous data, no loading indicator on refresh         | Pull-to-refresh, seamless UX, frequent refreshes  |

---

## 📌 **Recommendation:**
- **Use `.when()` + `skipLoadingOnRefresh: false` for AppBar-triggered refresh buttons.**
- **Use `.when()` + `skipLoadingOnRefresh: true` when working with `RefreshIndicator` to avoid flickering.**
- **Adopt `switch` syntax in simple pages where conciseness improves readability.**

