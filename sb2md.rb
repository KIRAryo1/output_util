filename = 'machine_learning.in'

File.open(filename, "r") do |io|
  txt = io.read

  first_line = txt.split("\n")[0]
  p first_line
end
