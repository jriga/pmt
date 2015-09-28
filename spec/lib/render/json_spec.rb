require 'spec_helper'
require 'table'
require 'render/json'
require 'json'

describe Render::Json do
  let(:table) { Table.build([1,2,3], [2,3]) {|r,c| r} }
  let(:json)  { {table: [ [nil,2,3], [1,1,1], [2,2,2], [3,3,3]]}.to_json }

  it "#draw display in json" do
    expect(Render::Json.draw(table)).to eq json
  end
end
