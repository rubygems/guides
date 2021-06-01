class OptionsListMarkdownizer
  # Builds markdownized option list of a Gem::Command
  def call(command)
    ui = Gem::SilentUI.new
    Gem::DefaultUserInteraction.use_ui ui do
      # Invoke the Ruby options parser by asking for help. Otherwise the
      # options list in the parser will never be initialized.
      command.show_help
    end

    parser = command.send(:parser)
    options = ''
    helplines = parser.summarize
    helplines.each do |helpline|
      break if (helpline =~ /Arguments/) || (helpline =~  /Summary/)
      next if helpline.strip == ''

      helpline = markdownize_options helpline

      if helpline =~ /^\s{10,}(.*)/
        options = options[0..-2] + " #{$1}\n"
      else
        if helpline =~ /^(.+)\s{2,}(.*)/
          helpline = "#{$1} - #{$2}"
        end
        if helpline =~ /options/i
          options += "\n### #{helpline.strip.delete_suffix(":")}\n\n"
        else
          options += "* #{helpline.strip}\n"
        end
      end
    end
    options
  end

  # Marks options mentioned on the given summary line
  def markdownize_options(line)
    # Mark options up as code (also prevents change of -- to &ndash;)
    option_line_re = /^(\s*)((?:-\w, )*--[^\s]+)( [A-Za-z_\[\],]+)*(\s{3,})(.+)/
    if option_line_re =~ line
      line.sub(option_line_re) do |m|
        "#{$1}`#{$2}#{$3}`#{$4}" +
          markdownize_inline_options($5)
      end
    else
      markdownize_inline_options(line)
    end
  end

  private

  def markdownize_inline_options(line)
    line.gsub(/(?<=\s)(--[^\s]+|-[^\s])/, '`\1`')
  end
end
