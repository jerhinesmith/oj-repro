#! /usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'

require 'active_model'
require 'active_model_serializers'
require 'active_support/json'

# Not requiring this fixes the issue
require 'oj_mimic_json'

class Category
  include ActiveModel::Model
  include ActiveModel::SerializerSupport

  attr_accessor :id, :name

  def initialize(id, name)
    @id   = id
    @name = name
  end
end

class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
end

category    = Category.new(1, 'test')
serializer  = CategorySerializer.new(category)

print "#to_json... "
to_json = serializer.to_json
if to_json == "{\"category\":{\"id\":1,\"name\":\"test\"}}"
  puts "Passed"
else
  print "Failed - "
  puts to_json
end

print "#as_json... "
as_json = serializer.as_json
if as_json == {:category=>{:id=>1, :name=>"test"}}
  puts "Passed"
else
  puts "Failed"
  puts as_json
end
