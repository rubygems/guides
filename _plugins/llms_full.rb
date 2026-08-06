# frozen_string_literal: true

# Concatenates the Markdown of every page listed in _data/sidebar.yml into
# _site/llms-full.txt, the full-text companion to /llms.txt. Pages without a
# Markdown alternate (the generated HTML man pages) are skipped.
module LlmsFull
  HEADER = <<~HEADER
    # RubyGems Guides

    > Everything about library management in Ruby: learn what gems are, how to use them in your projects, and how to build and publish your own.
  HEADER

  def self.each_item(sections, &block)
    sections.each do |section|
      (section["subsections"] || [section]).each do |subsection|
        subsection["items"].each do |item|
          block.call(item)
          (item["children"] || []).each(&block)
        end
      end
    end
  end
end

Jekyll::Hooks.register :site, :post_write do |site|
  chunks = [LlmsFull::HEADER]
  LlmsFull.each_item(site.data["sidebar"]) do |item|
    page = site.pages.find { |candidate| candidate.url.chomp("/") == item["url"] }
    next unless page && page.data["markdown_url"]

    chunks << <<~PAGE
      # #{page.data["title"]}

      Source: #{site.config["url"]}#{page.url}

      #{MarkdownAlternates.markdown_for(site, page).strip}
    PAGE
  end
  File.write(site.in_dest_dir("llms-full.txt"), chunks.join("\n---\n\n"))
end
