Pod::Spec.new do |s|
  s.name         = "SSTableViewCell"
  s.version      = "1.0.0"
  s.summary      = "Easy custom tableview cell for iOS."
  s.homepage     = "https://github.com/shingwasix/SSTableViewCell"
  s.screenshots  = "https://raw.githubusercontent.com/shingwasix/SSTableViewCell/master/screenshoot.jpg"
  s.license      = "MIT"
  s.author       = { "Shingwa Six" => "shingwasix@gmail.com" }
  s.platform     = :ios, "5.0"
  s.source       = { :git => "https://github.com/shingwasix/SSTableViewCell.git", :tag => "#{s.version}" }
  s.source_files  = "SSTableViewCell.{h,m}"
  s.frameworks = "Foundation", "CoreGraphics", "UIKit"
  s.requires_arc = true
end
