class Table
  class << self
    def build(rows, cols, &block)
      raise ArgumentError if (rows.nil? || rows.empty?) || (cols.nil? || cols.empty?)
      return new(rows, cols, []) unless block_given?

      cells = rows.map do |r|
        cols.map do |c|
          yield r, c
        end
      end

      new(rows, cols, cells)
    end
  end

  attr_reader :rows, :cols, :cells
  def initialize(rows, cols, cells=[])
    @rows = rows
    @cols = cols
    @cells = cells
  end
end
