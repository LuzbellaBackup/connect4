# frozen_string_literal: true

require 'fileutils'
require 'json'

# Player Class
class Player
  attr_reader :name_tag, :symbol, :stats

  def initialize(name_tag, order)
    @name_tag = name_tag
    @symbol = order.zero? ? 'a' : 'b'
    @stats = if File.exist?("data/user/#{@name_tag}.json")
               read_from_json
             else
               default_stats
             end
  end

  # FileUtils.mkdir_p 'data/lang' unless Dir.exist? 'data/lang'
  def default_stats
    Hash['games_played', 0, 'won', 0, 'lost', 0, 'winrate', 0]
  end

  def load_to_json
    FileUtils.mkdir_p 'data/user' unless Dir.exist? 'data/user'
    filename = "#{@name_tag}.json"
    File.open("data/user/#{filename}", 'w') { |file| file.write json_parser }
    puts "data saved at \"data/user/#{filename}\""
  end

  def read_from_json
    filename = "#{@name_tag}.json"
    file = File.read("data/user/#{filename}")
    p JSON.parse(file)
  end

  def update_stats(is_win)
    @stats['games_played'] += 1
    is_win ? @stats['won'] += 1 : @stats['lost'] += 1
    @stats['winrate'] = (@stats['won'] / @stats['games_played']) * 100
  end

  def update(is_win)
    update_stats(is_win)
    load_to_json
  end

  def json_parser
    to_parse = @stats
    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }
    JSON.generate(to_parse, opts)
  end
end
