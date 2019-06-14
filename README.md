# Getting Started with Fastlane 

[![N|Solid](https://docs.fastlane.tools/img/fastlane_text.png)](https://docs.fastlane.tools)

**fastlane** is the easiest way to automate beta deployments and releases for your iOS apps. 🚀 It handles all tedious tasks, like provisioning, certificates, beta testing, unit/ui testing, and releasing your application.

## System requirements
Currently, fastlane is officially supported to run on macOS, but they are also working on 🐧 Linux and 🖥️ Windows to support later, more in their [website.](https://docs.fastlane.tools)

## Version
macOS 10.14.5, Xcode 10.2.1, ruby 2.3.7, fastlane 2.125.2

## Agenda
We will discuss about 
* Installing fastlane
* Getting Started with fastlane
* Taking Screenshots
* Releasing to the App Store

### Installing Fastlane
To get started, download Xcode project. once the project is downloaded then navigate to the prject directory from Terminal.
```
cd /Users/zinuk/Downloads/Fastlane\ Tutos/Fastlane\ Tutorial 
```
![Terminal command](https://github.com/mdzinuk/Fastlane-Tuts/blob/master/Resources/Ternimal.png)
Check Ruby version, I used Ruby 2.3.7:
```
ruby -v
```

Install the latest Xcode command line tools from Terminal:
```
xcode-select --install
```
Install fastlane using ruby gems or homebrew, I used fastlane 2.125.2
RubyGems:
```
sudo gem install fastlane -NV
```
aleternatively Homebrew:
```
brew cask install fastlane
```
![Terminal command](https://github.com/mdzinuk/Fastlane-Tuts/blob/master/Resources/install-fastlane.png)
![Terminal command](https://github.com/mdzinuk/Fastlane-Tuts/blob/master/Resources/installed-fastlane.png)

### Getting Started with fastlane
Open the **Fastlane Tutorial**  project in Xcode to build, run and check it out and navigate from terminal if you are not done it yet
```
cd /Users/zinuk/Downloads/Fastlane\ Tutos/Fastlane\ Tutorial
# Check fastlane is installed or not
Mohammads-MBP:Fastlane Tutorial zinuk$ fastlane -version
```
Next enter
```
Mohammads-MBP:Fastlane Tutorial zinuk$ fastlane init
# then
Mohammads-MBP:fastlane zinuk$ cd fastlane
#and 
Mohammads-MBP:fastlane zinuk$ bundle install
```
![Terminal command](https://github.com/mdzinuk/Fastlane-Tuts/blob/master/Resources/fastlane-init.png)

![Terminal command](https://github.com/mdzinuk/Fastlane-Tuts/blob/master/Resources/after-install.png)

### Taking Screenshots
Open Gemfile and put these command
```
gem 'fastlane', '2.125.2'
gem 'xcode-install'
```

Open fastfile and paste the lins:

```
#!/usr/bin/env ruby
default_platform :ios
platform :ios do
  XCODE_VERSION = "10.2.1"
  
  before_all do
    xcversion(version: XCODE_VERSION)
    FastlaneCore::UI.important "Started building in #{XCODE_VERSION}."
  end
  
  desc "Take screenshots"
  lane :screenshots do
    capture_screenshots
    frame_screenshots(white: true)
  end
  
  desc "Uploads the app to the Testflight"
  lane :betaTesting do
    #will update later
  end
  
  desc "Subbmit app for Apple review."
  lane :submitApp do
    #will update later
  end
  
  desc "Release the app to the appstore"
  lane :releaseApp do
    # Will update later
  end
  
  after_all do |lane|
    FastlaneCore::UI.success "Success in #{lane}"
  end

  error do |lane, exception|
    FastlaneCore::UI.error "#{exception.message} in #{lane}"
  end
end
```

Similarly to Snapfile
```
# Uncomment the lines below you want to change by removing the # in the beginning
# A list of devices you want to take the screenshots from
 devices([
   "iPhone X",
   "iPad Pro (9.7-inch)"
 ])

 languages([
   "en-US"
])

# The name of the scheme which contains the UI Tests
scheme("Fastlane Tutorial")

# Where should the resulting screenshots be stored?
# output_directory("./screenshots")

# remove the '#' to clear all previously generated screenshots before creating new ones
# clear_previous_screenshots(true)

# Arguments to pass to the app on launch. See https://docs.fastlane.tools/actions/snapshot/#launch-arguments
# launch_arguments(["-favColor red"])

# For more information about all available options run
# fastlane action snapshot
```

Onemore thing to add SnapshotHelper.swift into UITest Target:
![Terminal command](https://github.com/mdzinuk/Fastlane-Tuts/blob/master/Resources/add-snapshothelper.png)

Run again to check required gems are installed successfully.
```
Mohammads-MBP:fastlane zinuk$ bundle instal
```
Now you can run:
```
bundle exec fastlane ios screenshots
```
If everything is okay then your browser will come up with screenshots under fastlane/screenshots directory!!!
### Releasing to the App Store

Continue.....
