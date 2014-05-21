Pod::Spec.new do |s|
  s.name         = "NKPinterestActivity"
  s.version      = "1.0.0"
  s.summary      = "A UIActivity subclass for sharing to Pinterest."
  s.homepage     = "https://github.com/neilkimmett/NKPinterestActivity"
  s.screenshots  = ["https://github.com/neilkimmett/NKPinterestActivity/raw/master/Screenshots/screenshot1.jpg", "https://github.com/neilkimmett/NKPinterestActivity/raw/master/Screenshots/screenshot2.jpg"]
  s.license      = "MIT"
  s.author       = { "Neil Kimmett" => "neil@kimmett.me" }
  s.social_media_url = "http://twitter.com/neilkimmett"
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/neilkimmett/NKPinterestActivity.git", :tag => "1.0.0" }
  s.source_files = "Classes", "NKPinterestActivity/NKPinterestActivity.{h,m}"
  s.resources    = "Resources/*.png"
  s.requires_arc = true
  s.dependency "Pinterest-iOS", "~> 2.3"
end
