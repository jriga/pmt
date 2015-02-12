require 'spec_helper'
require 'table'

describe Table do

  describe "::build" do
    let(:rows) { [2, 4] }
    let(:cols) { [1, 3] }
    let(:table) {
      described_class.build(rows, cols) {|r,c| r }
    }
    
    it "create a table with specified row header" do
      expect(table.rows).to match_array(rows)
    end

    it "create a table with specified col header" do
      expect(table.cols).to match_array(cols)
    end

    it "initializes cells" do
      expect(table.cells[0]).to match_array([2,2])
      expect(table.cells[1]).to match_array([4,4])
    end

    it "does not initialize cell without a block" do
      t = described_class.build(rows, cols)
      expect(t.cells).to be_empty
    end

    it "nil arg raises an error " do
      expect{described_class.build(nil, cols)}.to raise_error(ArgumentError)
    end

    it "empty arg raises an error " do
      expect{described_class.build([], cols)}.to raise_error(ArgumentError)
    end
  end

  
end
