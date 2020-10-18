class OptionsListMarkdownizer
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

      # Use zero-width space to prevent "helpful" change of -- to &ndash;
      helpline = helpline.gsub('--', '-&#8203;-').gsub('[', '\\[').gsub(']', '\\]')

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
end
