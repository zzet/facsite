require 'test_helper'

INVALID_FACTORIES = [
]

class FactoryTest < ActiveSupport::TestCase
  FactoryGirl.factories.map(&:name).each do |factory_name|
    next if INVALID_FACTORIES.include?(factory_name)
    test "#{factory_name} factory" do
      assert(build(factory_name).valid?)
    end
  end
end
