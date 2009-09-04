module Honsolo
  module Character
    class << self
      def find_id(name)
        name = name.downcase
        data = Honsolo.post("f" => "nick2id", "nickname[0]" => name)
        raise Honsolo::CharacterNotFound, name unless data.is_a?(Hash) && data.has_key?(name)
        data[name].to_i
      end

      def find(name_or_id)
        id = name_or_id.is_a?(Fixnum) ? name_or_id : find_id(name_or_id)
        data = Honsolo.post("f" => "get_all_stats", "account_id[0]" => id)
        raise Honsolo::CharacterNotFound, name_or_id if data["all_stats"].is_a?(Array) && data["all_stats"].empty?

        character = Honsolo.to_ostruct(data["all_stats"],id)
        character.last_match = Honsolo.to_ostruct(data["last_match"])
        character.clan_info  = Honsolo.to_ostruct(data["clan_info"],id)
        character
      end
    end
  end
end