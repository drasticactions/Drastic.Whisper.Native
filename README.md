# Drastic.Whisper

## Build Runtimes

The runtimes are compiled and placed into the underlying projects 'runtime' folders. If you want to build your own libraries, you can do the following.

### iOS (Devices)

```
cmake -G Xcode -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake -DPLATFORM=OS64COMBINED -S . -B build/ios

Add your Signing Certificate to the underlying Xcode project.

cmake --build build/ios --config Release

cp build/ios/external/whisper.cpp/Release-iphoneos/libwhisper.dylib runtimes/ios/libwhisper.dylib

```

### iOS Simulator (x64)

```
cmake -G Xcode -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake -DPLATFORM=SIMULATOR64 -S . -B build/iossim-x64

Add your Signing Certificate to the underlying Xcode project.

cmake --build build/iossim-x64 --config Release

cp build/iossim-x64/external/whisper.cpp/Release-iphonesimulator/libwhisper.dylib runtimes/iossim-x64/libwhisper.dylib

```

### iOS Simulator (ARM64)

```
cmake -G Xcode -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake -DPLATFORM=SIMULATORARM64 -S . -B build/iossim-arm64

Add your Signing Certificate to the underlying Xcode project.

cmake --build build/iossim-arm64 --config Release

cp build/iossim-arm64/external/whisper.cpp/Release-iphonesimulator/libwhisper.dylib runtimes/iossim-arm64/libwhisper.dylib

```

### tvOS

```
cmake -G Xcode -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake -DPLATFORM=TVOSCOMBINED -S . -B build/tvos

Add your Signing Certificate to the underlying Xcode project.

cmake --build build/tvos --config Release

cp build/tvos/external/whisper.cpp/Release-appletvos/libwhisper.dylib runtimes/tvos/libwhisper.dylib
```

### tvOS Simulator

```
cmake -G Xcode -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake -DPLATFORM=SIMULATOR_TVOS -S . -B build/tvos-x64

Add your Signing Certificate to the underlying Xcode project.

cmake --build build/tvos-x64 --config Release

cp build/tvos-x64/external/whisper.cpp/Release-appletvsimulator/libwhisper.dylib runtimes/tvos-x64/libwhisper.dylib
```

### tvOS Simulator

```
cmake -G Xcode -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake -DPLATFORM=SIMULATOR_TVOSARM64 -S . -B build/tvos-arm64

Add your Signing Certificate to the underlying Xcode project.

cmake --build build/tvos-arm64 --config Release

cp build/tvos-arm64/external/whisper.cpp/Release-appletvsimulator/libwhisper.dylib runtimes/tvos-arm64/libwhisper.dylib

lipo -create runtimes/tvos-arm64/libwhisper.dylib -create runtimes/tvos-x64/libwhisper.dylib -output libwhisper.dylib
```

### MacOS

```
cmake -G Xcode -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake -DPLATFORM=MAC_UNIVERSAL -S . -B build/macos

Add your Signing Certificate to the underlying Xcode project.

cmake --build build/macos --config Release

cp build/macos/external/whisper.cpp/Release/libwhisper.dylib runtimes/macos/libwhisper.dylib
```

### Catalyst (x64)

```
cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake -DPLATFORM=MAC_CATALYST -S . -B build/catalyst-x64

Add your Signing Certificate to the underlying Xcode project.

cmake -DCMAKE_BUILD_TYPE=Debug --build build/catalyst-x64 --config Debug

cp build/catalyst-x64/external/whisper.cpp/Debug/libwhisper.dylib runtimes/catalyst-x64/libwhisper.dylib
```

### Catalyst (arm64)

```
cmake -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake -DPLATFORM=MAC_CATALYST_ARM64 -S . -B build/catalyst-arm64

Add your Signing Certificate to the underlying Xcode project.

cmake -DCMAKE_BUILD_TYPE=Debug --build build/catalyst-arm64 --config Debug

cp build/catalyst-arm64/external/whisper.cpp/Debug/libwhisper.dylib runtimes/catalyst-arm64/libwhisper.dylib
```
