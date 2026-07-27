gem "rdoc", "~> 6.4"

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

desc "generate bundler command reference from the Bundler man pages"
task :bundler_reference => %w[RUBYGEMS_DIR_exists] do
  require 'cgi'
  require 'json'
  require 'nokogiri'
  require 'ronn'

  # The Bundler tree lives at the repository root on master, under
  # bundler/ on the stable branches.
  man_dir = %w[lib/bundler/man bundler/lib/bundler/man]
    .map { |path| File.join(ENV['RUBYGEMS_DIR'], path) }
    .find { |path| File.directory?(path) }
  abort "No Bundler man directory found under #{ENV['RUBYGEMS_DIR']}" unless man_dir

  bundler_version = File.read(File.expand_path('../version.rb', man_dir))[/VERSION = "([^"]+)"/, 1]

  def titleize(header)
    header.split(" ").map(&:capitalize).join(" ")
  end

  slugs = Dir.glob(File.join(man_dir, '*.ronn')).map do |path|
    File.basename(path)[/\A(.+)\.\d\w*\.ronn\z/, 1]
  end.sort

  # gemfile(5) replaces the former hand-written Gemfiles guide at /gemfile,
  # the bundle commands live next to the gem command reference.
  url_for = ->(slug) { slug == 'gemfile' ? '/gemfile' : "/command-reference/#{slug}" }

  pages = {}

  mkdir_p 'command-reference'

  Dir.glob(File.join(man_dir, '*.ronn')).sort.each do |ronn_path|
    slug = File.basename(ronn_path)[/\A(.+)\.\d\w*\.ronn\z/, 1]
    title = slug.tr('-', ' ')

    doc = Ronn::Document.new(ronn_path)
    content = Nokogiri::HTML(doc.to_html).at('body').children

    # Ported from bundler-site's man:strip_pages task.
    content.search('.man-navigation').remove
    content.search('ol.man-decor').remove

    synopsis = content.search('#SYNOPSIS').first
    if synopsis
      synopsis.next_element.name = 'pre'
      synopsis.remove
    end

    whatis = content.search('.man-whatis').text
    content.search('p.man-name').remove
    content.search('#NAME').remove

    content.search('h2, h3').each { |elem| elem.content = titleize(elem.content) }

    # Rewrite man cross references (relative or via bundler.io) to local pages.
    content.search('a[href]').each do |a|
      next unless a['href'] =~ %r{\A(?:https://bundler\.io/man/)?([a-z0-9-]+)\.\d\w*\.html(#.*)?\z}
      next unless slugs.include?($1)
      a['href'] = "#{url_for.call($1)}/#{$2}"
    end

    pages[slug] = { title: title, whatis: whatis, content: content.to_html.strip }
  end

  chain = ['/command-reference'] + slugs.map { |slug| url_for.call(slug) } + ['/getting_started']

  slugs.each_with_index do |slug, index|
    page = pages[slug]
    File.write "command-reference/#{slug}.html", <<~PAGE
      ---
      layout: default
      title: #{page[:title].to_json}
      description: #{page[:whatis].to_json}
      url: #{url_for.call(slug)}
      permalink: #{url_for.call(slug)}/
      previous: #{chain[index]}
      next: #{chain[index + 2]}
      ---

      <em class="text-neutral-600">#{CGI.escapeHTML(page[:whatis])}</em>

      <p>This reference was automatically generated from Bundler version #{bundler_version}.</p>

      #{page[:content]}
    PAGE
  end
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

desc "Recreate data/known_plugins.yml from RubyGems.org data."
task :regenerate_known_plugins_yml do
  require "json"
  require "rubygems/package"
  require "rubygems/remote_fetcher"
  require "yaml"

  known_plugins = %w[
    bootboot
    extended_bundler-errors
  ]
  skipped_gems = %w[
    bundler-explain
    bundler-fast_git
    bundler-interactive source-does-not-exist yanked-all-but-last
    bundler-next
    bundler-security
    bundler-shellsplit-plugin
  ]

  rubygems = Gem::Source.new("https://rubygems.org")
  known_plugins = rubygems.load_specs(:latest).filter_map do |name_tuple|
    next unless name_tuple.name.start_with?("bundler-") ||
                known_plugins.include?(name_tuple.name)
    next if skipped_gems.include?(name_tuple.name)

    spec = rubygems.fetch_spec(name_tuple)
    path = rubygems.download(spec, Gem.dir)
    gem = Gem::Package.new(path)
    # make sure it's actually a Bundler plugin
    next unless gem.contents.include?("plugins.rb")
    next unless spec.homepage
    next unless spec.summary

    {
      name: spec.name,
      summary: spec.summary,
      uri: spec.homepage
    }
  end

  File.write(File.expand_path("_data/known_plugins.yml", __dir__), YAML.dump(known_plugins))
  puts "Saved #{known_plugins.size} plugins as data/known_plugins.yml"
  puts "Done."
end
