# The in-app browser on Windows (docs/WINDOWS-BROWSER-PLAN.md): a static library linked into the
# runner when the build switch is on (client/windows/CMakeLists.txt).
cmake_minimum_required(VERSION 3.14)
project(casama_app_browser LANGUAGES CXX)

# The WebView2 SDK (headers and the static loader, so no extra DLL ships), from NuGet, checked
# against its known hash. The runtime itself comes with Windows (Evergreen).
set(WEBVIEW2_VERSION "1.0.4370.26")
set(WEBVIEW2_SHA256 "1c0dacac84b70109b3fd42f90c53a0ba942abc3a87590d7a4e0ccd86e4a06cf4")
set(WEBVIEW2_DIR "${CMAKE_BINARY_DIR}/webview2-${WEBVIEW2_VERSION}")
if(NOT EXISTS "${WEBVIEW2_DIR}/build/native/include/WebView2.h")
  set(WEBVIEW2_PKG "${CMAKE_BINARY_DIR}/webview2-${WEBVIEW2_VERSION}.nupkg")
  file(DOWNLOAD
    "https://api.nuget.org/v3-flatcontainer/microsoft.web.webview2/${WEBVIEW2_VERSION}/microsoft.web.webview2.${WEBVIEW2_VERSION}.nupkg"
    "${WEBVIEW2_PKG}"
    EXPECTED_HASH SHA256=${WEBVIEW2_SHA256}
    TLS_VERIFY ON)
  file(MAKE_DIRECTORY "${WEBVIEW2_DIR}")
  execute_process(
    COMMAND ${CMAKE_COMMAND} -E tar xf "${WEBVIEW2_PKG}"
    WORKING_DIRECTORY "${WEBVIEW2_DIR}"
    RESULT_VARIABLE WEBVIEW2_UNPACK)
  if(NOT WEBVIEW2_UNPACK EQUAL 0)
    message(FATAL_ERROR "Couldn't unpack the WebView2 SDK")
  endif()
endif()

add_library(casama_app_browser STATIC
  "app_browser.cpp"
  "app_browser_cursor.cpp"
  "json_lite.cpp"
)

apply_standard_settings(casama_app_browser)
# Exceptions stay off (_HAS_EXCEPTIONS=0 in apply_standard_settings); std::filesystem calls use the
# error_code overloads.
target_compile_definitions(casama_app_browser PRIVATE NOMINMAX)

target_include_directories(casama_app_browser
  PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}"
  PRIVATE "${WEBVIEW2_DIR}/build/native/include")

target_link_libraries(casama_app_browser PRIVATE
  flutter
  flutter_wrapper_app
  "${WEBVIEW2_DIR}/build/native/x64/WebView2LoaderStatic.lib"
  version.lib
  gdiplus.lib
  shlwapi.lib
)
