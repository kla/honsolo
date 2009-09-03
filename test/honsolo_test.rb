require File.dirname(__FILE__) + '/test_helper'

class HonsoloTest < ActiveSupport::TestCase
  context "#post" do
    should "return nil if request failed" do
      Net::HTTP.stubs(:post_form => Net::HTTPNotFound.new(nil,nil,nil))
      assert !Honsolo.post(nil)
    end
  end

  context "#to_ostruct" do
    setup { @ostruct = Honsolo.to_ostruct(:a => "one", :b => "two", :nested => {:c => "three"}) }

    should "work" do
      assert_equal "one", @ostruct.a
      assert_equal "two", @ostruct.b
    end

    should "work with a nested hash" do
      assert_equal "three", @ostruct.nested.c
    end
  end
end