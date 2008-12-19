require File.dirname(__FILE__) + '/spec_helper'
require 'rubygems'
require 'spec'
require 'sequel'

DB = Sequel.sqlite

describe "opp" do
  it "adds opp_filter_out to Sequel::Models" do
    lambda do
      class Foo < Sequel::Model
        opp_filter_out :an_ugly_field
      end
    end.should_not raise_error
  end

  it "does nothing to a field that doesn't exist" do
    DB.create_table :example do
      primary_key :id
      varchar :name
    end

    class Bar < Sequel::Model(:example)
    end

    before_bar_inspect = Bar.new(:name => 'bar').inspect

    class Bar < Sequel::Model(:example)
      opp_filter_out :nonexistent_field
    end

    after_bar_inspect = Bar.new(:name => 'bar').inspect

    before_bar_inspect.should == after_bar_inspect
  end
end