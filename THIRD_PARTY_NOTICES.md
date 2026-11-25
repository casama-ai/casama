# Third-Party Notices

The open parts in this repository depend on the following third-party software, each used under
its own license. This file is written by the sync from Casama's private repository.

## Node.js packages

| Package                                 | Used in                                               | License           |
| --------------------------------------- | ----------------------------------------------------- | ----------------- |
| @biomejs/biome | casama (tooling) | MIT OR Apache-2.0 |
| pdfjs-dist | @casama/extension (runtime) | Apache-2.0 |
| @hono/zod-openapi | @casama/contracts (runtime) | MIT |
| @openapitools/openapi-generator-cli | @casama/contracts (tooling) | Apache-2.0 |
| @types/node | casama (tooling) | MIT |
| hono | @casama/contracts (runtime) | MIT |
| turbo | casama (tooling) | MIT |
| typescript | casama (tooling) | Apache-2.0 |
| vitest | casama (tooling) | MIT |
| zod | @casama/contracts (runtime) | MIT |
| @playwright/test | @casama/extension (end-to-end tests) | Apache-2.0 |
| @types/chrome | @casama/extension (tooling) | MIT |
| vite | @casama/extension (build) | MIT |
| openapi-fetch | @casama/client (runtime), @casama/extension (runtime) | MIT |

## Dart packages

| Package                                                               | Used in                            | License                       |
| --------------------------------------------------------------------- | ---------------------------------- | ----------------------------- |
| args                                                                  | casama_cli                         | BSD-3-Clause                  |
| dio                                                                   | casama_api, casama_sdk, casama_cli | MIT                           |
| http                                                                  | casama_sdk, casama_cli             | BSD-3-Clause                  |
| qr                                                                    | casama_cli (sign-in code in a terminal) | BSD-3-Clause             |
| path                                                                  | casama_cli                         | BSD-3-Clause                  |
| pinenacl                                                              | casama_cli (gallery signature check) | MIT                         |
| json_annotation, json_serializable                                    | casama_api                         | BSD-3-Clause                  |
| copy_with_extension, copy_with_extension_gen                          | casama_api                         | MIT                           |
| build_runner                                                          | casama_api (tooling)               | BSD-3-Clause                  |
| test, lints                                                           | all Dart packages (tooling)        | BSD-3-Clause                  |
| supabase_flutter                                                      | client                             | MIT                           |
| flutter_riverpod                                                      | client                             | MIT                           |
| flex_color_scheme                                                     | client                             | BSD-3-Clause                  |
| go_router, flutter_localizations, intl                                | client                             | BSD-3-Clause                  |
| xterm                                                                 | client                             | MIT                           |
| markdown_widget                                                       | client                             | MIT                           |
| file_picker                                                           | client                             | MIT                           |
| file_picker_linux, file_selector_platform_interface                   | client (Linux file dialogs)        | MIT; BSD-3-Clause             |
| share_plus, web_socket_channel                                        | client                             | BSD-3-Clause                  |
| sentry_flutter                                                        | client                             | MIT                           |
| firebase_core, firebase_messaging                                     | client                             | BSD-3-Clause                  |
| flutter_webrtc                                                        | client                             | MIT                           |
| flutter_callkit_incoming                                              | client (phone calls)               | MIT                           |
| sherpa_onnx (and the downloaded sherpa-onnx GigaSpeech keyword model) | client (wake word)                 | Apache-2.0                    |
| archive                                                               | client (wake word model unpacking) | MIT                           |
| crypto                                                                | client, casama_sdk, casama_cli, computerd | BSD-3-Clause                  |
| posthog_flutter                                                       | client                             | MIT                           |
| record, just_audio                                                    | client (voice)                     | BSD-3-Clause, MIT             |
| flutter_soloud (with the SoLoud engine)                               | client (live-call audio playback)  | MIT, zlib                     |
| flutter_secure_storage                                                | client (companion, app lock)       | BSD-3-Clause                  |
| local_auth, local_auth_android, local_auth_darwin, local_auth_windows | client (app lock)                  | BSD-3-Clause                  |
| window_manager, tray_manager, hotkey_manager                          | client (desktop)                   | MIT                           |
| home_widget, receive_sharing_intent                                   | client (mobile extras)             | BSD-3-Clause, Apache-2.0      |
| in_app_purchase, in_app_purchase_android, url_launcher                | client (billing)                   | BSD-3-Clause                  |
| mocktail                                                              | client (tooling)                   | MIT                           |
| haptic_feedback                                                       | client                             | BSD-3-Clause                  |
| stupid_simple_sheet, motor, scroll_drag_detector                      | client                             | MIT                           |
| phone_numbers_parser                                                  | client (phone number formatting)   | MIT                           |
| passkeys (Corbado; web bundle with @github/webauthn-json vendored)    | client (passkey sign-in)           | MIT                           |
| biometric_signature                                                   | client (admin screen-lock check)   | MIT                           |

## Other software

| Software                               | Role                           | License                                        |
| -------------------------------------- | ------------------------------ | ---------------------------------------------- |
| Neko (m1k1o/neko), built from source   | desktop image: WebRTC streamer | Apache-2.0                                     |
| X.Org server, Openbox, Mousepad        | desktop image                  | MIT/X11, GPL-2.0 (system packages, unmodified) |
| OpenAPI Generator (dart-dio templates) | code generation                | Apache-2.0                                     |

## Fonts

| Font   | Used in                                   | License                                      |
| ------ | ----------------------------------------- | -------------------------------------------- |
| Nunito | client (headlines; `client/assets/fonts`) | SIL Open Font License 1.1 (`Nunito-OFL.txt`) |
