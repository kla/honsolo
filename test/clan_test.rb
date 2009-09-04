require File.dirname(__FILE__) + '/test_helper'

class ClanTest < ActiveSupport::TestCase
  context "#find" do
    setup { @clan = Honsolo::Clan.find(1) }

    should "have a roster" do
      assert !@clan.clan_roster.empty?
    end

    should "raise exception if not found" do
      assert_raise(Honsolo::ClanNotFound) { Honsolo::Clan.find(-1) }
    end
  end
end