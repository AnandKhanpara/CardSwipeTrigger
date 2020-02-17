
Pod::Spec.new do |spec|

  spec.name         = "CardSwipeTrigger"
  spec.version      = "0.0.5"
  spec.summary      = "Add CardSwipeTrigger"
  
  spec.description  = <<-DESC
  This CocoaPods library helps you perform CardSwipeTrigger.
                   DESC

  spec.homepage     = "https://github.com/AnandKhanpara/CardSwipeTrigger"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Anand Khanpara" => "anandkhanpara111@gmail.com" }
  spec.ios.deployment_target = "12.0"
  spec.swift_version = "5"
  spec.source       = { :git => "https://github.com/AnandKhanpara/CardSwipeTrigger.git", :tag => "#{spec.version}" }
  spec.source_files  = "CardSwipeTrigger/**/*.{h,m,swift}"

end
