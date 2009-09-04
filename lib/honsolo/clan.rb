module Honsolo
  module Clan
    class << self
      def find(clan_id)
        data = Honsolo.post("f" => "clan_list", "clan_id" => clan_id)
        raise ClanNotFound, clan_id if data["clan_roster"]["error"]

        OpenStruct.new(:clan_roster => data["clan_roster"].collect { |id, member| Honsolo.to_ostruct(member) })
      end
    end
  end
end

