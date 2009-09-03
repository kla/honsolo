module Honsolo
  module Character
    class << self
      def find_id(name)
        name = name.downcase
        data = Honsolo.post("f" => "nick2id", "nickname[0]" => name)
        raise Honsolo::CharacterNotFound, name unless data.is_a?(Hash) && data.has_key?(name)
        data[name].to_i
      end

      def find(name)
        id = find_id(name)
        data = Honsolo.post("f" => "get_all_stats", "account_id[0]" => id)
        Honsolo.to_ostruct(data, id)
      end
    end
  end
end