
Pod::Spec.new do |s|
  s.name             = 'voronoimaptoolkit'
  s.version          = '0.1.0'
  s.summary          = 'Create and display Voronoi tessellations on MKMapView.'
  s.description      = <<-DESC
                                Create and display Voronoi tessellations as overlays of an MKMapView inside a UIViewController subclass. Includes custom MKPolygon subclasses to represent Voronoi cells, custom draggable annotations corresponding to Voronoi sites, a wrapper class for MKMapView, and a UIViewController that manages the display and animation of the tessellation.
                                DESC

  s.homepage         = 'https://github.com/<DevRhys>/voronoimaptoolkit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rhys D. Jones' => 'rhys@digitalcicadas.com' }
  s.source           = { :git => 'https://github.com/<DevRhys>/voronoimaptoolkit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'voronoimaptoolkit/Classes/**/*.{h,m}'

  s.dependency 'iosvoronoi'
end
