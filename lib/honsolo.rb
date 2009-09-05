require 'net/http'
require 'ostruct'
require 'php_serialize'
require File.dirname(__FILE__) + '/honsolo/character'
require File.dirname(__FILE__) + '/honsolo/clan'

module Honsolo
  MasterServer = URI.parse('http://masterserver.hon.s2games.com/client_requester.php')

  class CharacterNotFound < StandardError; end
  class ClanNotFound < StandardError; end

  class << self
    def post(params)
      response = Net::HTTP.post_form(MasterServer,params)
      response.is_a?(Net::HTTPSuccess) ? PHP.unserialize(response.body) : nil
    end

    def to_ostruct(hash, character_id=nil, parent=nil)
      return hash unless hash.is_a?(Hash)

      obj = parent ? parent : OpenStruct.new
      hash.each do |k,v|
        next if k == 0

        if k == character_id && v.is_a?(Hash)
          to_ostruct(v,character_id,obj)
        else
          if v.is_a?(Hash)
            v = to_ostruct(v,character_id)
          elsif v.is_a?(String)
            v = v.to_i if v =~ /-?[0-9]+/
          end
          obj.send("#{k}=",v)
        end
      end
      obj
    end
  end
end
