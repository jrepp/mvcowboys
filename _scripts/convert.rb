#!/usr/bin/ruby
require 'yaml'
require 'reverse_markdown'

Dir.foreach('.') do |filename|
  next if not filename.end_with? 'html'

  puts "CONVERTING " + filename 
  marker_index = 0
  lines = []
  doc = nil
  content = nil
  front_matter = ''
  front_matter_content = ''
  File.open(filename).each do |line|
    # process front matter
    if line.start_with? '---' then
      if marker_index == 1 then
        #puts "PARSING: " + lines.join('')
        front_matter_content = lines.join('')
        front_matter = YAML.load(front_matter_content)
        lines = []
      end
      marker_index += 1
    else
      lines << line
    end
  end

  content = ReverseMarkdown.convert(lines.join(''))

  f = File.new(filename.sub('html', 'md'), 'w+')
  f << "---\n"
  f << front_matter_content
  f << "---\n"
  f << content

  #puts "FRONT: " + doc.inspect
  #puts "CONTENT: " + content
end
