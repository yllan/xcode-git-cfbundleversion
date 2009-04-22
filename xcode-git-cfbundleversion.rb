# xcode-git-cfbundleversion.rb
# Update CFBundleVersion in Info.plist file with short Git revision string
#
# This is based on
# http://www.codecollector.net/view/1736/Bazaar_revno_build_phase_script
# http://github.com/jsallis/xcode-git-versioner
# http://github.com/juretta/iphone-project-tools/tree/v1.0.3

# Fail if not run from Xcode
raise "Must be run from Xcode's Run Script Build Phase" unless ENV['XCODE_VERSION_ACTUAL']

require 'rubygems'
begin
	require 'osx/plist'
rescue LoadError => e
	puts "You need to '[sudo] gem install kballard-osx-plist' after '[sudo] gem sources -a http://gems.github.com/'"
	exit 1
end

# Get the current git revision hash
revision = `/opt/local/bin/git rev-parse --short HEAD`.chomp!

# Update Info.plist file
plistFile = File.join(ENV['BUILT_PRODUCTS_DIR'], ENV['INFOPLIST_PATH'])
plist = OSX::PropertyList.load(File.open(plistFile))
plist['CFBundleVersion'] = revision
OSX::PropertyList.dump(File.open(plistFile, 'w'), plist, format = :xml1)

# Report to the user
puts "CFBundleVersion in #{plistFile} sets to '#{revision}'"
