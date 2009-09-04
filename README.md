# Honsolo #

Ruby library for querying game information from Heroes of Newerth (http://www.heroesofnewerth.com/).

## Example Usage ##

character = Honsolo::Character.find("teeto")
puts character.inspect

guild = Honsolo::Clan.find(character.clan_info.clan_id)
puts guild.inspect
