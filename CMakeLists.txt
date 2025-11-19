cmake_minimum_required(VERSION 3.16)
project(example LANGUAGES CXX)

include(FetchContent)

FetchContent_Declare(
  webview
  GIT_REPOSITORY https://github.com/webview/webview
  GIT_TAG 0.12.0)
FetchContent_MakeAvailable(webview)


