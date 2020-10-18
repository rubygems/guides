require_relative 'spec_helper'
require_relative '../lib/options_list_markdownizer'

describe OptionsListMarkdownizer do
  let(:subject) { OptionsListMarkdownizer.new }

  [
    # make sure that lines without options don't suffer any harm
    [''],
    ['nothing interesting'],

    # real-life examples of option lines
    [
      "        --norc                       Avoid loading any .gemrc file\n",
      "        `--norc`                       Avoid loading any .gemrc file\n",
      'long option only',
    ],
    [
      "        --host HOST                  Yank from another gemcutter-compatible host\n",
      "        `--host HOST`                  Yank from another gemcutter-compatible host\n",
      'long option with argument',
    ],
    [
      "    -h, --help                       Get help on this command\n",
      "    `-h, --help`                       Get help on this command\n",
      'short and long option',
    ],
    [
      "    -s, --source URL                 Append URL to list of remote gem sources\n",
      "    `-s, --source URL`                 Append URL to list of remote gem sources\n",
      'short, long, argument',
    ],
    [
      "    -b, --build EMAIL_ADDR           Build private key and self-signed\n",
      "    `-b, --build EMAIL_ADDR`           Build private key and self-signed\n",
      'argument with underscore',
    ],
    [
      "    -g, --file [FILE]                Read from a gem dependencies API file and\n",
      "    `-g, --file [FILE]`                Read from a gem dependencies API file and\n",
      'short, long, optional argument',
    ],
    [
      "    -V, --[no-]verbose               Set the verbose level of output\n",
      "    `-V, --[no-]verbose`               Set the verbose level of output\n",
      'short option and boolean switch long',
    ],
  ].each do |given,expected,description|
    it (description || given) do
      expected = given if expected.nil?

      _(subject.markdownize_options(given)).must_equal expected
    end
  end
end
