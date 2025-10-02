cask "scan-organizer" do
  version "1.1.3"
  sha256 "91fb37455cb72db3b6a0fe7773440cedafc53cd7e7f31e2eedf28bacd4f17773"

  url "https://github.com/jonaskern-dev/scan-organizer/releases/download/v#{version}/ScanOrganizer-#{version}.zip"
  name "Scan Organizer"
  desc "Intelligent PDF document processing with OCR and AI-powered classification"
  homepage "https://github.com/jonaskern-dev/scan-organizer"

  depends_on macos: ">= :sonoma"
  depends_on formula: "ollama"

  app "ScanOrganizer.app", target: "Scan Organizer.app"

  postflight do
    # Start Ollama service
    system_command "/usr/local/bin/brew",
                   args: ["services", "start", "ollama"],
                   print_stderr: false

    # Install Finder Quick Action
    service_name = "Process with Scan Organizer"
    services_dir = "#{Dir.home}/Library/Services"
    workflow_path = "#{services_dir}/#{service_name}.workflow"

    system_command "mkdir", args: ["-p", services_dir]

    # Create workflow structure
    system_command "mkdir", args: ["-p", "#{workflow_path}/Contents"]

    # Create Info.plist
    info_plist = <<~XML
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
          <key>NSServices</key>
          <array>
              <dict>
                  <key>NSMenuItem</key>
                  <dict>
                      <key>default</key>
                      <string>#{service_name}</string>
                  </dict>
                  <key>NSMessage</key>
                  <string>runWorkflowAsService</string>
                  <key>NSSendFileTypes</key>
                  <array>
                      <string>pdf</string>
                      <string>com.adobe.pdf</string>
                  </array>
                  <key>NSRequiredContext</key>
                  <dict>
                      <key>NSApplicationIdentifier</key>
                      <string>com.apple.finder</string>
                  </dict>
              </dict>
          </array>
          <key>AMIsActive</key>
          <true/>
      </dict>
      </plist>
    XML

    File.write("#{workflow_path}/Contents/Info.plist", info_plist)

    # Create workflow document
    workflow_doc = <<~XML
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
          <key>AMApplicationBuild</key>
          <string>523</string>
          <key>AMApplicationVersion</key>
          <string>2.10</string>
          <key>AMDocumentVersion</key>
          <string>2</string>
          <key>actions</key>
          <array>
              <dict>
                  <key>action</key>
                  <dict>
                      <key>AMActionVersion</key>
                      <string>2.0.3</string>
                      <key>ActionBundlePath</key>
                      <string>/System/Library/Automator/Run Shell Script.action</string>
                      <key>ActionName</key>
                      <string>Run Shell Script</string>
                      <key>ActionParameters</key>
                      <dict>
                          <key>COMMAND_STRING</key>
                          <string>for f in "$@"
      do
          if [[ "$f" == *.pdf ]]; then
              echo "$f" &gt;&gt; "$HOME/Library/Application Support/ScanOrganizer/queue.txt"
          fi
      done
      open -a "Scan Organizer" 2&gt;/dev/null || true
      </string>
                          <key>CheckedForUserDefaultShell</key>
                          <true/>
                          <key>inputMethod</key>
                          <integer>1</integer>
                          <key>shell</key>
                          <string>/bin/bash</string>
                      </dict>
                  </dict>
              </dict>
          </array>
          <key>workflowMetaData</key>
          <dict>
              <key>serviceInputTypeIdentifier</key>
              <string>com.apple.Automator.fileSystemObject</string>
              <key>serviceOutputTypeIdentifier</key>
              <string>com.apple.Automator.nothing</string>
              <key>workflowTypeIdentifier</key>
              <string>com.apple.Automator.servicesMenu</string>
          </dict>
      </dict>
      </plist>
    XML

    File.write("#{workflow_path}/Contents/document.wflow", workflow_doc)

    # Register app with Launch Services
    system_command "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister",
                   args: ["-f", "/Applications/Scan Organizer.app"]

    # Flush Services cache
    system_command "/System/Library/CoreServices/pbs", args: ["-flush"], print_stderr: false

    # Print installation instructions
    ohai "Scan Organizer installed successfully!"
    puts ""
    puts "Ollama service has been started."
    puts ""
    puts "On first launch, you will be prompted to download AI models."
    puts "The models will be downloaded automatically (~12.7 GB, 10-20 minutes)."
    puts ""
    puts "Finder Quick Action is available:"
    puts "  Right-click PDF → Services → 'Process with Scan Organizer'"
    puts ""
    puts "You may need to restart Finder:"
    puts "  killall Finder"
  end

  uninstall_preflight do
    # Remove Finder Quick Action
    service_name = "Process with Scan Organizer"
    services_dir = "#{Dir.home}/Library/Services"
    workflow_path = "#{services_dir}/#{service_name}.workflow"

    if File.directory?(workflow_path)
      system_command "rm", args: ["-rf", workflow_path]
    end

    # Flush Services cache
    system_command "/System/Library/CoreServices/pbs", args: ["-flush"], print_stderr: false
  end

  zap trash: [
    "~/Library/Application Support/ScanOrganizer",
    "~/Documents/ScanOrganizer",
  ]

  caveats <<~EOS
    Ollama service has been started automatically.

    On first launch, Scan Organizer will prompt you to download AI models.
    Click "Install Models Now" and the models will download automatically.

    The Finder Quick Action may require restarting Finder:
      killall Finder
  EOS
end