require 'json'

module Render
  class Json
    def self.draw(table)
      json = {
        table: prepare(table)
      }.to_json

      print json
      json
    end

    def self.prepare(table)
      output = []
      output << [nil, table.cols].flatten
      
      table.rows.each_with_index do |v,i|
        output << [v, table.cells[i]].flatten
      end
     output
    end
  end
end
