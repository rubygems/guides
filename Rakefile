gem "rdoc"

require 'rdoc/rdoc'
require 'rdoc/task'
require 'fileutils'

require_relative 'lib/options_list_markdownizer'

$:.unshift '.', '../rubygems/lib'

ENV['RUBYGEMS_DIR'] ||= File.expand_path '../../..', __FILE__

task :RUBYGEMS_DIR_exists do
  message = <<-NO_RUBYGEMS_DIR
The Rubygems rdocs are required to build the spec guide.

Install or clone it from GitHub, then:

    RUBYGEMS_DIR=/path/to/rubygems/source rake spec_guide --trace

The RUBYGEMS_DIR is assumed to exist at:

    #{ENV['RUBYGEMS_DIR']}
  NO_RUBYGEMS_DIR

  abort message unless File.exist? ENV['RUBYGEMS_DIR']
end

# RUBYGEMS_DIR should be checked first
task rdoc_spec: %w[RUBYGEMS_DIR_exists]

RDoc::Task.new(:rdoc_spec) do |rd|
  spec_file = File.join(ENV["RUBYGEMS_DIR"].to_s, "lib", "rubygems", "specification.rb")
  rd.rdoc_files.include(spec_file)
  rd.template = "jekdoc"
  rd.options << '--quiet'
end

desc "move spec guide into the right place"
task :move_spec => %w[specification-reference.md]

file 'html/Gem/Specification.html' => %w[rdoc_spec]

file 'specification-reference.md' => %w[html/Gem/Specification.html] do
  cp 'html/Gem/Specification.html', 'specification-reference.md'
end

desc "clean up after rdoc"
task :clean do
  FileUtils.rm_rf "html"
end

desc "generate specification guide"
task :spec_guide => [:rdoc_spec, :move_spec, :clean]

desc "generate command guide"
task :command_guide => %w[command-reference.md]

command_reference_files = Rake::FileList.new(*%W[
  Rakefile
  command-reference.erb
  #{ENV['RUBYGEMS_DIR']}/lib/rubygems.rb
  #{ENV['RUBYGEMS_DIR']}/lib/rubygems/command_manager.rb
  #{ENV['RUBYGEMS_DIR']}/lib/rubygems/commands/*.rb
])

file 'command-reference.md' =>
     %w[RUBYGEMS_DIR_exists] + command_reference_files do
  require 'rubygems/command_manager'
  require 'rdoc/erbio'

  names    = Gem::CommandManager.instance.command_names
  commands = {}
  names.each do |name|
    command = Gem::CommandManager.instance[name]
    command.options[:help] = ''
    commands[name] = command
  end

  def htmlify(string)
    lines = string.split("\n")
    html_string = ''
    lines.each do |line|
      if line
        if line =~ /^  /
          # This will end up in a <pre> block
          html_string += line
        else
          html_string += line.gsub("<", "&lt;").gsub(">", "&gt;")
        end
        html_string += "\n"
      end
    end
    html_string[0..-2]
  end

  def argument_list_item(string)
    if string =~ /^(\S+)(.*)/
      string = "*#{$1}* - #{$2}"
    end
    htmlify("* #{string}")
  end

  def options_list(command)
    OptionsListMarkdownizer.new.call command
  end

  filename = "command-reference.erb"

  erbio = ERB.new File.read(filename), trim_mode: '-'
  content = erbio.result(binding).gsub(ENV["HOME"], "~")

  File.write 'command-reference.md', content
end

desc "serve documentation on http://localhost:4000"
task :server do
  pids = [
    spawn('jekyll', 'serve', '4000'),
    spawn('sass', '--watch', 'stylesheets:stylesheets'),
  ]

  trap "INT" do
    Process.kill "INT", *pids
    exit 1
  end

  trap "TERM" do
    Process.kill "TERM", *pids
    exit 1
  end

  pids.each do |pid|
    Process.waitpid pid
  end
end

desc 'build documentation and display it on http://localhost:4000'
task default: %w[spec_guide command_guide server]
