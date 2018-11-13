def headline_bold(str)
  str.gsub(/\[\* (.+?)\]/, '__\1__')
end

def inline_bold(str)
  str.gsub(/\[\[(.+?)\]\]/, '__\1__')
end

def headline_size(str)
  matches = str.match(/\[(\*\*+) (.+?)\]/)
  return matches ? "#" * (7 - matches[1].length) + " " + matches[2] : str
end

def numerical_formula(str)
  # str.gsub(/\[\$ ([^\[]+\[.+?\][^\]]+?|.+?)\]/, '$$ \1 $$')
  str.gsub(/^\[\$ (.+?)\]$/, '$$ \1 $$').gsub(/\[\$ (.+?)\]/, '$ \1 $')
end

def embedded_gyazo(str)
  str.gsub(/^\[https:\/\/gyazo(.+?)\]$/, '![Image from Gyazo](https://i.gyazo\1.png)')
end

def embedded_picture(str)
  str.gsub(/^\[(.+?)\]$/, '![picture](\1)')
end

def footmark_for_numerical_formula(str)
  str.gsub(/ _([^_])/, '_\1')
end


filename = ARGV[0] || 'machine_learning.in'
outfile = filename.split('.')[0] + '.out'
txt = ""

File.open(filename, "r") do |io|
  txt = io.read

  lines = txt.split("\n")

  lines = lines.map{|e| headline_bold(e)}
  lines = lines.map{|e| inline_bold(e)}
  lines = lines.map{|e| headline_size(e)}
  lines = lines.map{|e| numerical_formula(e)}
  lines = lines.map{|e| embedded_gyazo(e)}
  lines = lines.map{|e| embedded_picture(e)}
  lines = lines.map{|e| footmark_for_numerical_formula(e)}

  # markdown new line needs 2 \n's.
  txt = lines.join("\n\n")
end

File.open(outfile, "w") do |io|
  io.puts txt
end
