# TapticKit

TapticKit makes it easier to use Taptic engine for haptic feedback. Supports all generations of Taptic engine. If the device doesn't support the latest feedback types, TapticKit falls back on using older ones as substitutes.

## Installation

### [CocoaPods](https://guides.cocoapods.org/using/using-cocoapods.html)

```ruby
# Podfile
use_frameworks!

target 'YOUR_TARGET_NAME' do
    pod 'TapticKit'
end
```

Replace `YOUR_TARGET_NAME` and then, in the `Podfile` directory, type:

```bash
$ pod install
```

### [Carthage](https://github.com/Carthage/Carthage)

Add this to `Cartfile`

```
github "devandsev/TapticKit"
```

In the `Cartfile` directory, type:

```bash
$ carthage update
```

## Usage examples

As Apple recommends
>Preparing the generator can reduce latency when triggering feedback. This is particularly important when trying to match feedback to sound or visual cues. Calling the generator’s prepare() method puts the Taptic Engine in a prepared state. To preserve power, the Taptic Engine stays in this state for only a short period of time (on the order of seconds), or until you next trigger feedback.

```swift
TapticKit.prepare(for: .notification(.success))
```

Then you can trigger your feedback:

```swift
TapticKit.trigger(.notification(.success))
```

Finally, you can release engine, this lets the Taptic Engine return to its idle state. It is optional.

```swift
TapticKit.release()
```

Though it's recommended to prepare before you trigger an event and to release the engine aftewards, you don't have to, if latency is not critical.

All available feedback types:
```swift
TapticKit.trigger(.notification(.success))
TapticKit.trigger(.notification(.error))
TapticKit.trigger(.notification(.warning))

TapticKit.trigger(.selection)

TapticKit.trigger(.impact(.light))
TapticKit.trigger(.impact(.medium))
TapticKit.trigger(.impact(.heavy))
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
