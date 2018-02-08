require 'nokogiri'
require 'pry'

class Parser
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def parse
    labels.zip(entries).map do |label_node, entry_node|
      LineParser.new(label_node, entry_node).parsed_line
    end
  end

  private

  def labels
    @labels = doc.xpath('//plist/dict/key')
  end

  def entries
    @entries = doc.xpath('//plist/dict/dict')
  end

  def file
    @file ||= File.open(path, 'r')
  end

  def doc
    @doc ||= Nokogiri::XML(file)
  end

  class LineParser
    attr_accessor :label_node, :entry_node

    def initialize(label_node, entry_node)
      @label_node = label_node
      @entry_node = entry_node
    end

    def parsed_line
      "#{label}: ##{parsed_hex_values}"
    end

    private

    def label
      @label ||= label_node.text
    end

    def relevant_node_text
      @relevant_node_text ||= entry_node.text.lines[3..-1].join
    end

    def parsed_hex_values
      @parsed_hex_values ||= relevant_node_text
        .scan(/\d.\d+/)
        .reverse
        .map { |value| (value.to_f * 255).round.to_s(16) }
        .join
    end
  end
end

puts Parser.new(ARGV[0]).parse
