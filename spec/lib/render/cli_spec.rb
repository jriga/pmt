require 'spec_helper'
require 'table'
require 'render/cli'

describe Render::Cli do
  let(:table) { Table.new([1,12],[2,3], [[6,600], [0,10]]) }
  let(:drawing) { "      2   3\n  1   6 600\n 12   0  10\n" }

  it "draws in the console" do
    expect(described_class.draw(table)).to eq drawing
  end
end
