#include "json_lite.h"

#include <cstdio>
#include <cstdlib>

namespace casama_json {

namespace {

const Value& Null() {
  static const Value v;
  return v;
}

struct Parser {
  const std::string& s;
  size_t i = 0;
  bool failed = false;

  void Ws() {
    while (i < s.size() && (s[i] == ' ' || s[i] == '\n' || s[i] == '\r' || s[i] == '\t')) i++;
  }

  static void AppendUtf8(std::string& out, unsigned cp) {
    if (cp < 0x80) {
      out.push_back(static_cast<char>(cp));
    } else if (cp < 0x800) {
      out.push_back(static_cast<char>(0xC0 | (cp >> 6)));
      out.push_back(static_cast<char>(0x80 | (cp & 0x3F)));
    } else if (cp < 0x10000) {
      out.push_back(static_cast<char>(0xE0 | (cp >> 12)));
      out.push_back(static_cast<char>(0x80 | ((cp >> 6) & 0x3F)));
      out.push_back(static_cast<char>(0x80 | (cp & 0x3F)));
    } else {
      out.push_back(static_cast<char>(0xF0 | (cp >> 18)));
      out.push_back(static_cast<char>(0x80 | ((cp >> 12) & 0x3F)));
      out.push_back(static_cast<char>(0x80 | ((cp >> 6) & 0x3F)));
      out.push_back(static_cast<char>(0x80 | (cp & 0x3F)));
    }
  }

  unsigned Hex4() {
    if (i + 4 > s.size()) {
      failed = true;
      return 0;
    }
    unsigned v = 0;
    for (int k = 0; k < 4; k++) {
      const char c = s[i++];
      v <<= 4;
      if (c >= '0' && c <= '9') v |= c - '0';
      else if (c >= 'a' && c <= 'f') v |= c - 'a' + 10;
      else if (c >= 'A' && c <= 'F') v |= c - 'A' + 10;
      else failed = true;
    }
    return v;
  }

  std::string String() {
    std::string out;
    i++;  // opening quote
    while (i < s.size()) {
      const char c = s[i++];
      if (c == '"') return out;
      if (c != '\\') {
        out.push_back(c);
        continue;
      }
      if (i >= s.size()) break;
      const char e = s[i++];
      switch (e) {
        case '"': out.push_back('"'); break;
        case '\\': out.push_back('\\'); break;
        case '/': out.push_back('/'); break;
        case 'b': out.push_back('\b'); break;
        case 'f': out.push_back('\f'); break;
        case 'n': out.push_back('\n'); break;
        case 'r': out.push_back('\r'); break;
        case 't': out.push_back('\t'); break;
        case 'u': {
          unsigned cp = Hex4();
          if (cp >= 0xD800 && cp <= 0xDBFF && i + 6 <= s.size() && s[i] == '\\' && s[i + 1] == 'u') {
            i += 2;
            const unsigned lo = Hex4();
            if (lo >= 0xDC00 && lo <= 0xDFFF) cp = 0x10000 + ((cp - 0xD800) << 10) + (lo - 0xDC00);
          }
          AppendUtf8(out, cp);
          break;
        }
        default: failed = true; return out;
      }
    }
    failed = true;
    return out;
  }

  Value Parse(int depth) {
    Value v;
    if (depth > 64) {
      failed = true;
      return v;
    }
    Ws();
    if (i >= s.size()) {
      failed = true;
      return v;
    }
    const char c = s[i];
    if (c == '{') {
      v.kind = Value::Kind::kObject;
      i++;
      Ws();
      if (i < s.size() && s[i] == '}') {
        i++;
        return v;
      }
      while (!failed) {
        Ws();
        if (i >= s.size() || s[i] != '"') {
          failed = true;
          break;
        }
        std::string key = String();
        Ws();
        if (i >= s.size() || s[i] != ':') {
          failed = true;
          break;
        }
        i++;
        v.object[key] = Parse(depth + 1);
        Ws();
        if (i < s.size() && s[i] == ',') {
          i++;
          continue;
        }
        if (i < s.size() && s[i] == '}') {
          i++;
          break;
        }
        failed = true;
      }
    } else if (c == '[') {
      v.kind = Value::Kind::kArray;
      i++;
      Ws();
      if (i < s.size() && s[i] == ']') {
        i++;
        return v;
      }
      while (!failed) {
        v.array.push_back(Parse(depth + 1));
        Ws();
        if (i < s.size() && s[i] == ',') {
          i++;
          continue;
        }
        if (i < s.size() && s[i] == ']') {
          i++;
          break;
        }
        failed = true;
      }
    } else if (c == '"') {
      v.kind = Value::Kind::kString;
      v.string = String();
    } else if (s.compare(i, 4, "true") == 0) {
      v.kind = Value::Kind::kBool;
      v.boolean = true;
      i += 4;
    } else if (s.compare(i, 5, "false") == 0) {
      v.kind = Value::Kind::kBool;
      i += 5;
    } else if (s.compare(i, 4, "null") == 0) {
      i += 4;
    } else {
      const char* start = s.c_str() + i;
      char* end = nullptr;
      v.number = std::strtod(start, &end);
      if (end == start) {
        failed = true;
      } else {
        v.kind = Value::Kind::kNumber;
        i += static_cast<size_t>(end - start);
      }
    }
    return v;
  }
};

}  // namespace

const Value& Value::operator[](const std::string& key) const {
  if (kind != Kind::kObject) return Null();
  auto it = object.find(key);
  return it == object.end() ? Null() : it->second;
}

const Value& Value::operator[](size_t index) const {
  if (kind != Kind::kArray || index >= array.size()) return Null();
  return array[index];
}

Value Parse(const std::string& text) {
  Parser p{text};
  Value v = p.Parse(0);
  if (p.failed) return Value{};
  return v;
}

std::string Quote(const std::string& s) {
  std::string out;
  out.reserve(s.size() + 16);
  out.push_back('"');
  for (unsigned char c : s) {
    switch (c) {
      case '"': out += "\\\""; break;
      case '\\': out += "\\\\"; break;
      case '\n': out += "\\n"; break;
      case '\r': out += "\\r"; break;
      case '\t': out += "\\t"; break;
      case '<': out += "\\u003c"; break;
      case '>': out += "\\u003e"; break;
      default:
        if (c < 0x20) {
          char hex[8];
          std::snprintf(hex, sizeof(hex), "\\u%04x", c);
          out += hex;
        } else {
          out.push_back(static_cast<char>(c));
        }
    }
  }
  out.push_back('"');
  return out;
}

}  // namespace casama_json
