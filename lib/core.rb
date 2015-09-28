$:.unshift File.expand_path(File.join(File.dirname(__FILE__), '.'))
require 'optparse'
require 'prime'
require 'table'
require 'render/cli'
require 'render/json'

options = {}
Fixnum.include(Prime)

OptionParser.new do |opts|
  opts.banner = "Usage: #$0 -s size"

  opts.on "-s", "--size ROWSxCOLUMNS", "Table dimension (default 10x10)" do |s|
    dim = s.split('x')
    options[:rows] = dim.first.to_i
    options[:cols] = dim.last.to_i
  end

  opts.on "-h", "--help", "Display this help" do
    warn opts
    exit
  end

  opts.on "-f", "--format FORMAT", "choose output format" do |s|
    options[:format] = s
  end
end.parse!

options[:rows] = 10 if options[:rows].nil?
options[:cols] = 10 if options[:cols].nil?

h = { rows: Prime.generate.first(options[:rows]),  cols: Prime.generate.first(options[:cols]) }

table = Table.build(h[:rows], h[:cols]) {|r,c| r*c }

if options[:format] == 'json'
 Render::Json.draw(table)
else
  Render::Cli.draw(table, " | ")
end
