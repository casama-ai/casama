#include "url_scheme.h"

#include <windows.h>
#include <appmodel.h>

#include <string>

namespace {

constexpr const wchar_t kSchemeKey[] = L"Software\\Classes\\casama";
constexpr const wchar_t kCommandKey[] = L"Software\\Classes\\casama\\shell\\open\\command";
constexpr const wchar_t kIconKey[] = L"Software\\Classes\\casama\\DefaultIcon";

// Whether this process runs from an MSIX package (the Store build), which declares the scheme
// itself.
bool IsPackaged() {
  UINT32 length = 0;
  return GetCurrentPackageFullName(&length, nullptr) != APPMODEL_ERROR_NO_PACKAGE;
}

std::wstring ReadDefault(const wchar_t* key) {
  wchar_t value[2 * MAX_PATH] = {};
  DWORD size = sizeof(value);
  if (RegGetValueW(HKEY_CURRENT_USER, key, nullptr, RRF_RT_REG_SZ, nullptr, value, &size) !=
      ERROR_SUCCESS) {
    return L"";
  }
  return value;
}

bool WriteString(const wchar_t* key, const wchar_t* name, const std::wstring& value) {
  return RegSetKeyValueW(HKEY_CURRENT_USER, key, name, REG_SZ, value.c_str(),
                         static_cast<DWORD>((value.size() + 1) * sizeof(wchar_t))) ==
         ERROR_SUCCESS;
}

// The program a registered command starts: the first quoted part of `"C:\...\casama.exe" "%1"`.
std::wstring ProgramOf(const std::wstring& command) {
  if (command.size() < 2 || command[0] != L'"') return L"";
  const size_t end = command.find(L'"', 1);
  return end == std::wstring::npos ? L"" : command.substr(1, end - 1);
}

}  // namespace

void RegisterUrlScheme() {
  if (IsPackaged()) return;

  wchar_t exe[MAX_PATH] = {};
  const DWORD length = GetModuleFileNameW(nullptr, exe, MAX_PATH);
  if (length == 0 || length >= MAX_PATH) return;

  const std::wstring command = L"\"" + std::wstring(exe) + L"\" \"%1\"";
  const std::wstring current = ReadDefault(kCommandKey);
  if (current == command) return;

#ifndef NDEBUG
  // A debug build takes the scheme only when no installed copy still holds it.
  const std::wstring holder = ProgramOf(current);
  if (!holder.empty() && GetFileAttributesW(holder.c_str()) != INVALID_FILE_ATTRIBUTES) return;
#endif

  WriteString(kSchemeKey, nullptr, L"URL:Casama");
  WriteString(kSchemeKey, L"URL Protocol", L"");
  WriteString(kIconKey, nullptr, L"\"" + std::wstring(exe) + L"\",0");
  WriteString(kCommandKey, nullptr, command);
}
