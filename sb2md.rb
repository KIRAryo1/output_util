filename = ARGV[0] || 'machine_learning.in'
outfile = filename.split('.')[0] + '.out'
txt = ""

File.open(filename, "r") do |io|
  txt = io.read

  first_line = txt.split("\n")
  p first_line[0]
end

File.open(outfile, "w") do |io|
  io.puts txt
end
