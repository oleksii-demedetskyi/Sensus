Pod::Spec.new do |s|

  s.name         = "Sensus"
  s.version      = "0.0.1"
  s.summary      = "Sensus is small DSL for extracting strongly typed data from NSDictionary"

  s.description  = <<-DESC
                   We create Sensus to help you quick and _safe_ extract values from your raw server responses.
                   We focusing on data conversions and DSL manner of writing code.
                   DESC

  s.homepage     = "https://github.com/DAlOG/Sensus"

  s.license      = "MIT (example)"

  s.author             = { "Alexey DAloG Demedeckiy" => "dalog@me.com" }

  s.ios.deployment_target = "5.0"
  s.osx.deployment_target = "10.7"

  s.source       = { :git => "https://github.com/DAlOG/Sensus.git", :tag => "0.0.1" }

  s.source_files  = "Sensus", "Sensus/**/*.{h,m}"
  s.public_header_files = "Sensus/Sensus.h"

  s.requires_arc = true

end
