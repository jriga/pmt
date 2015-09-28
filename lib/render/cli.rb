module Render
  class Cli
    class << self
      def draw(table, seperator=" ", line_break="\n")
        cell_space = table.cells.flatten.max.to_s.size
        
        output = add_column_header(table, seperator, line_break, cell_space)

        data = []
        table.rows.each_with_index do |r,i|
          data << [r, table.cells[i]].flatten
        end

        output << data.map do |current_row|
          current_row.map do|cell|
            cell.to_s.rjust(cell_space)
          end.join(seperator)
        end.join(line_break)

        output << line_break
        print output
        output
      end
      
      private
      def add_column_header(table, s, l, cs)
        ["",table.cols].flatten.map {|cell| cell.to_s.rjust(cs) }.join(s) + l
      end
      
    end
  end
end
