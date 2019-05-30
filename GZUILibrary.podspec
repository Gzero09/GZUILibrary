Pod::Spec.new do |spec|

  spec.name         = "GZUILibrary"
  spec.version      = "0.0.2"
  spec.summary      = "A UI Framework Written in Swift"

  spec.description  = <<-DESC
This CocoaPods library Helps you add Custom NavigationBar,Tab Bar, Alert, and much more (Rotation Not Supported).
                   DESC

  spec.homepage     = "https://github.com/Gzero09/GZUILibrary"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Ground Zero" => "groundzero.development09@gmail.com" }

  spec.ios.deployment_target = "10.0"
  spec.swift_version = "5"

  spec.source        = { :git => "https://github.com/Gzero09/GZUILibrary.git", :tag => "#{spec.version}" }
  spec.source_files  = "GZUILibrary/**/*.{h,m,swift}"

end