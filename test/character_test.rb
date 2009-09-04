require File.dirname(__FILE__) + '/test_helper'

class CharacterTest < ActiveSupport::TestCase
  context "#find_id" do
    setup { @id = Honsolo::Character.find_id("teeto") }

    should "return an id" do
      assert_kind_of Fixnum, @id
      assert @id > 0
    end
  end

  context "#find" do
    setup { @character = Honsolo::Character.find("TEETO") }

    should "not have all_stats" do
      assert !@character.all_stats
    end

    should "have a nickname" do
      assert_equal "teeto", @character.nickname
    end

    should "have last_match" do
      assert_kind_of Array, @character.last_match
    end
 
    should "have clan_info" do
      assert @character.clan_info
    end

    should "raise exception if not found" do
      assert_raise(Honsolo::CharacterNotFound) { Honsolo::Character.find(-1) }
    end
  end
end