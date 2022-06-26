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
      "    -s, --spec-dir a,b,c             Search for gems under specific paths\n",
      "    `-s, --spec-dir a,b,c`             Search for gems under specific paths\n",
      'short, long and argument list',
    ],
    [
      "    -V, --[no-]verbose               Set the verbose level of output\n",
      "    `-V, --[no-]verbose`               Set the verbose level of output\n",
      'short option and boolean switch long',
    ],
    [
      "    -K, --private-key KEY            Key for --sign or --build. -g/--file can be used.\n",
      "    `-K, --private-key KEY`            Key for `--sign` or `--build`. `-g`/`--file` can be used.\n",
      'long option in description',
    ],
    [
      "    -R, --re-sign                    Re-signs the certificate from -C with the key from -K\n",
      "    `-R, --re-sign`                    Re-signs the certificate from `-C` with the key from `-K`\n",
      'short option in description',
    ],
    [
      "                                     and the certificate from -C\n",
      "                                     and the certificate from `-C`\n",
      'short option in description continuation',
    ],
    [
      "    -C PATH                      Run as if gem build was started in <PATH> instead of the current working directory.\n",
      "    `-C PATH`                      Run as if gem build was started in <PATH> instead of the current working directory.\n",
      'short option only with argument',
    ],
  ].each do |given,expected,description|
    it (description || given) do
      expected = given if expected.nil?

      _(subject.markdownize_options(given)).must_equal expected
    end
  end
end
