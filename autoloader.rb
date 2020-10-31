################################################################################
# AUTOLOADER
#
# Loads components into application.
################################################################################

paths = ["components/*.rb"].map(&:freeze).freeze

paths.each do |path|
 Dir[File.join(App.root, path)].each do |file|

   # Skip self.
   next if file.include?('autoloader')

   require file

 end
end
