#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "thundercats"
  s.version          = "1.0.0"
  s.summary          = "Useful categories"
  s.description      = <<-DESC
                       Useful categories used by Metova
                       DESC
  s.homepage         = "http://metova.com"
  s.license          = 'MIT'
  s.author           = { "Kurt Treangen" => "kurt.treangen@metova.com" }
  s.source           = { :git => "https://github.com/metova/thundercats.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.requires_arc = true
  s.source_files = 'Categories/*.{h,m}'
  s.public_header_files = 'Categories/*.h'
end
