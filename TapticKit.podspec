Pod::Spec.new do |s|
  s.name         = "TapticKit"
  s.version      = "0.1.0"
  s.summary      = "Make use of Taptic engine for haptic feedback"
  s.description  = <<-DESC
    Your description here.
  DESC
  s.homepage     = "https://github.com/devandsev/TapticKit"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Andrey Sevrikov" => "devandsev@gmail.com" }
  s.ios.deployment_target = "8.0"
  s.source       = { :git => s.homepage + ".git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks   = "Foundation", "AudioToolbox"
end
