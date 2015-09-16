Pod::Spec.new do |s|

  s.name         = "Sensus"
  s.version      = "0.0.2"
  s.summary      = "Sensus is small DSL for extracting strongly typed data from NSDictionary"

  s.description  = <<-DESC
                   We create Sensus to help you quick and _safe_ extract values from your raw server responses.
                   We focusing on data conversions and DSL manner of writing code.
                   DESC

  s.homepage     = "https://github.com/DAlOG/Sensus"

  s.license      = "MIT"

  s.author             = { "Alexey DAloG Demedeckiy" => "dalog@me.com"}

  s.ios.deployment_target = "5.0"
  s.osx.deployment_target = "10.7"

  s.source       = { :git => "https://github.com/DAlOG/Sensus.git", :tag => 'v0.0.2' }

  s.source_files  = "Sensus/**/*.{h,m}"
  s.header_mappings_dir = 'Sensus/'

  s.requires_arc = true

end
