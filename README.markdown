xcode-git-cfbundleversion.rb
============================

Update CFBundleVersion in Info.plist file with short Git revision string

How to use
----------

1. Right-click the target you want to add the versioning phase to (usually the target that builds your app)
2. Select: Add -> New Build Phase -> New Run Script Build Phase
3. Specify /usr/bin/ruby as the Shell for the script
4. Paste the script body into the Script text area
5. Ensure that the build phase is at the end of the target's list of build phases

References
----------

This script is based on following people's works:

* [http://github.com/jsallis/xcode-git-versioner](http://github.com/jsallis/xcode-git-versioner)
* [http://github.com/juretta/iphone-project-tools/tree/v1.0.3](http://github.com/juretta/iphone-project-tools/tree/v1.0.3)
