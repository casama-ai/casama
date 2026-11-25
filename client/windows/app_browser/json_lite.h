// A small JSON reader and string escaper for the in-app browser's DevTools protocol messages
// (docs/WINDOWS-BROWSER-PLAN.md §1.2). It reads what Chromium sends; it isn't a general library.
#ifndef CASAMA_APP_BROWSER_JSON_LITE_H_
#define CASAMA_APP_BROWSER_JSON_LITE_H_

#include <map>
#include <memory>
#include <string>
#include <vector>

namespace casama_json {

struct Value {
  enum class Kind { kNull, kBool, kNumber, kString, kArray, kObject };
  Kind kind = Kind::kNull;
  bool boolean = false;
  double number = 0;
  std::string string;
  std::vector<Value> array;
  std::map<std::string, Value> object;

  // Missing keys and wrong kinds read as null, so lookups chain: v["a"]["b"].Str().
  const Value& operator[](const std::string& key) const;
  const Value& operator[](size_t index) const;
  bool IsNull() const { return kind == Kind::kNull; }
  std::string Str(const std::string& fallback = "") const {
    return kind == Kind::kString ? string : fallback;
  }
  double Num(double fallback = 0) const { return kind == Kind::kNumber ? number : fallback; }
  int Int(int fallback = 0) const {
    return kind == Kind::kNumber ? static_cast<int>(number) : fallback;
  }
  bool Bool(bool fallback = false) const { return kind == Kind::kBool ? boolean : fallback; }
};

// Parses `text`; a malformed document gives a null Value.
Value Parse(const std::string& text);

// `"..."` with JSON escapes. `<` and `>` are escaped too, so the result is safe inside a script.
std::string Quote(const std::string& s);

}  // namespace casama_json

#endif  // CASAMA_APP_BROWSER_JSON_LITE_H_
