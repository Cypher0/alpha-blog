require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "sports")
  end

  test "should be valid" do
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = ''
    refute @category.valid?
  end

  test "name should be unique" do
    @category.save
    category2 = Category.new(name: "sports")
    refute category2.valid?
  end

  test "name should not be too long" do
    @category.name = 'a' * 26
    refute @category.valid?
  end

  test "name should not be too short" do
    @category.name = "aa"
    refute @category.valid?
  end
end
