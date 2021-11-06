#!/usr/bin/env bash

# Flutter
if [[ -z "flutter" ]]; then
  echo "No Flutter!"
  FLUTTER_ROOT="${HOME}/.flutter"
  readonly FLUTTER_ROOT
  git clone https://github.com/flutter/flutter.git -b stable "${FLUTTER_ROOT}"
  export PATH="${PATH}:${FLUTTER_ROOT}/bin"
fi

DOCTOR_ERRORS="$(flutter doctor | grep ✗)"
readonly DOCTOR_ERRORS
echo "${DOCTOR_ERRORS}"

if [[ "${DOCTOR_ERRORS}" == *"CocoaPods"* ]]; then
  echo "No CocoaPods"
  # For Cocoapad, first install ruby
  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
  RBVERSION="3.0.1"
  rbenv install "${RBVERSION}"
  rbenv global "${RBVERSION}"
  gem install cocoapods
fi

# Android
if [[ "${DOCTOR_ERRORS}" == *"cmdline-tools"* ]]; then
  echo "No Android cmdline-tools"
  UNAME="$(uname)"
  TMP_DIR="$(mktemp -d)"
  if [[ "${UNAME}" == "Darwin" ]]; then
    ANDROID_SDK_ROOT="${HOME}/Library/Android/sdk"
    wget "https://dl.google.com/android/repository/commandlinetools-mac-7583922_latest.zip" \
      -P "${TMP_DIR}"
  elif [[ "${UNAME}" == "Linux" ]]; then
    wget "https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip" \
      -P "${TMP_DIR}"
  fi
  ANDROID_CLI_ROOT="${HOME}/.bin/android_cli"
  mkdir -p "${ANDROID_CLI_ROOT}"
  # unzip "${TMP_DIR}/commandlinetools*.zip" -d "${ANDROID_CLI_ROOT}"
  "${ANDROID_CLI_ROOT}/cmdline-tools/bin/sdkmanager"  \
    --sdk_root="$(git rev-parse --show-toplevel)" \
    --install "cmdline-tools;latest"
  export PATH="${PATH}:${ANDROID_CLI_ROOT}/cmdline-tools/bin"
fi

# Android license status
if [[ "${DOCTOR_ERRORS}" == *"Android license status"* ]]; then
  echo "Android license status unkown"
  flutter doctor --android-licenses
fi
