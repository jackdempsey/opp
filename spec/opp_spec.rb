require File.dirname(__FILE__) + '/spec_helper'
require 'rubygems'
require 'spec'
require 'sequel'

describe "opp" do
  it "adds opp_filter_out to Sequel::Models" do
    lambda do
      class Foo < Sequel::Model
        opp_filter_out :an_ugly_field
      end
    end.should_not raise_error
  end
end