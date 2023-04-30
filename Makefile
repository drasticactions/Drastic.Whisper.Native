BUILD_TYPE=Release

linux_x64:
	cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -S . -B build/linux-x64
	cmake --build build/linux-x64 --config $(BUILD_TYPE)
	mkdir -p runtimes/linux-x64
	cp build/linux-x64/whisper.cpp/libwhisper.so ./runtimes/linux-x64/whisper.so

linux_arm64:
	cmak -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -S . -B build/linux-arm64
	cmake --build build/linux-arm64 --config $(BUILD_TYPE)
	mkdir -p runtimes/linux-arm64
	cp build/linux-arm64/whisper.cpp/libwhisper.so ./runtimes/linux-arm64/whisper.so

macos:
	cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake -DPLATFORM=MAC_UNIVERSAL -S . -B build/macos
	cmake --build build/macos
	mkdir -p runtimes/macos
	cp build/macos/whisper.cpp/libwhisper.dylib runtimes/macos/libwhisper.dylib

ios:
	cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake -DPLATFORM=OS -S . -B build/ios
	cmake --build build/ios
	mkdir -p runtimes/ios
	cp build/ios/whisper.cpp/libwhisper.dylib runtimes/ios/libwhisper.dylib

ios_64:
	cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake -DPLATFORM=OS64 -S . -B build/ios_64
	cmake --build build/ios_64
	mkdir -p runtimes/ios_64
	cp build/ios_64/whisper.cpp/libwhisper.dylib runtimes/ios_64/libwhisper.dylib

maccatalyst_x64:
	cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake -DPLATFORM=MAC_CATALYST -S . -B build/maccatalyst_x64
	cmake --build build/maccatalyst_x64
	mkdir -p runtimes/maccatalyst_x64
	cp build/maccatalyst_x64/whisper.cpp/libwhisper.dylib runtimes/maccatalyst_x64/libwhisper.dylib

maccatalyst_arm64:
	cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake -DPLATFORM=MAC_CATALYST_ARM64 -S . -B build/maccatalyst_arm64
	cmake --build build/maccatalyst_arm64
	mkdir -p runtimes/maccatalyst_arm64
	cp build/maccatalyst_arm64/whisper.cpp/libwhisper.dylib runtimes/maccatalyst_arm64/libwhisper.dylib

ios_simulator_x64:
	cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake -DPLATFORM=SIMULATOR64 -S . -B build/ios_simulator_x64
	cmake --build build/ios_simulator_x64
	mkdir -p runtimes/ios_simulator_x64
	cp build/ios_simulator_x64/whisper.cpp/libwhisper.dylib runtimes/ios_simulator_x64/libwhisper.dylib

ios_simulator_arm64:
	cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake -DPLATFORM=SIMULATORARM64 -S . -B build/ios_simulator_arm64
	cmake --build build/ios_simulator_arm64
	mkdir -p runtimes/ios_simulator_arm64
	cp build/ios_simulator_arm64/whisper.cpp/libwhisper.dylib runtimes/ios_simulator_arm64/libwhisper.dylib

tvos_simulator_x64:
	cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake -DPLATFORM=SIMULATOR_TVOS -S . -B build/tvos_simulator_x64
	cmake --build build/tvos_simulator_x64
	mkdir -p runtimes/tvos_simulator_x64
	cp build/tvos_simulator_x64/whisper.cpp/libwhisper.dylib runtimes/tvos_simulator_x64/libwhisper.dylib

tvos_simulator_arm64:
	cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake -DPLATFORM=SIMULATOR_TVOSARM64 -S . -B build/tvos_simulator_arm64
	cmake --build build/tvos_simulator_arm64
	mkdir -p runtimes/tvos_simulator_arm64
	cp build/tvos_simulator_arm64/whisper.cpp/libwhisper.dylib runtimes/tvos_simulator_arm64/libwhisper.dylib

tvos:
	cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake -DPLATFORM=TVOS -S . -B build/tvos
	cmake --build build/tvos
	mkdir -p runtimes/tvos
	cp build/tvos/whisper.cpp/libwhisper.dylib runtimes/tvos/libwhisper.dylib

lipo:
	mkdir -p lib/tvos-simulator
	lipo -create runtimes/tvos_simulator_arm64/libwhisper.dylib -create runtimes/tvos_simulator_x64/libwhisper.dylib -output lib/tvos-simulator/libwhisper.dylib
	mkdir -p lib/ios-simulator
	lipo -create runtimes/ios_simulator_arm64/libwhisper.dylib -create runtimes/ios_simulator_x64/libwhisper.dylib -output lib/ios-simulator/libwhisper.dylib
	mkdir -p lib/ios-device
	cp runtimes/ios/libwhisper.dylib lib/ios-device/libwhisper.dylib
	mkdir -p lib/maccatalyst
	lipo -create runtimes/maccatalyst_x64/libwhisper.dylib -create runtimes/maccatalyst_arm64/libwhisper.dylib -output lib/maccatalyst/libwhisper.dylib
	mkdir -p lib/tvos-device
	cp runtimes/tvos/libwhisper.dylib lib/tvos-device/libwhisper.dylib
	mkdir -p lib/macos
	cp runtimes/macos/libwhisper.dylib lib/macos/libwhisper.dylib

android_arm64-v8a:
	cmake -DCMAKE_ANDROID_ARCH_ABI=arm64-v8a -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCMAKE_SYSTEM_NAME=Android -DCMAKE_ANDROID_API=21 -DCMAKE_ANDROID_NDK=/Users/drasticactions/Library/Developer/Xamarin/android-sdk-macosx/ndk-bundle -S . -B build/android-arm64-v8a
	cmake --build build/android-arm64-v8a
	mkdir -p runtimes/android-arm64-v8a
	cp build/android-arm64-v8a/whisper.cpp/libwhisper.so runtimes/android-arm64-v8a/libwhisper.so

android_x86:
	cmake -DCMAKE_ANDROID_ARCH_ABI=x86 -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCMAKE_SYSTEM_NAME=Android -DCMAKE_ANDROID_API=21 -DCMAKE_ANDROID_NDK=/Users/drasticactions/Library/Developer/Xamarin/android-sdk-macosx/ndk-bundle -S . -B build/android-x86
	cmake --build build/android-x86
	mkdir -p runtimes/android-x86
	cp build/android-x86/whisper.cpp/libwhisper.so runtimes/android-x86/libwhisper.so

android_x86_64:
	cmake -DCMAKE_ANDROID_ARCH_ABI=x86_64 -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCMAKE_SYSTEM_NAME=Android -DCMAKE_ANDROID_API=21 -DCMAKE_ANDROID_NDK=/Users/drasticactions/Library/Developer/Xamarin/android-sdk-macosx/ndk-bundle -S . -B build/android-x86_64
	cmake --build build/android-x86_64
	mkdir -p runtimes/android-x86_64
	cp build/android-x86_64/whisper.cpp/libwhisper.so runtimes/android-x86_64/libwhisper.so

xcframework:
	mkdir -p output/lib
	xcrun xcodebuild -create-xcframework -library lib/ios-device/libwhisper.dylib -library lib/ios-simulator/libwhisper.dylib -library lib/tvos-device/libwhisper.dylib -library lib/tvos-simulator/libwhisper.dylib -library lib/macos/libwhisper.dylib -library lib/maccatalyst/libwhisper.dylib -output output/lib/whisper.xcframework