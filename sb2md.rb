def headline_size(str)
  matches = str.match(/\[\* (.+?)\]/)
  return matches ? "__" + matches[1] + "__" : str
end

def inline_bold(str)
  matches = str.match(/\[\[(.+?)\]\]/)
  return matches ? "__" + matches[1] + "__" : str
end

filename = ARGV[0] || 'machine_learning.in'
outfile = filename.split('.')[0] + '.out'
txt = ""

File.open(filename, "r") do |io|
  txt = io.read

  lines = txt.split("\n")

  lines = lines.map{|e| headline_size(e)}
  lines = lines.map{|e| inline_bold(e)}

  txt = lines.join("\n")
end

File.open(outfile, "w") do |io|
  io.puts txt
end

# p txt
