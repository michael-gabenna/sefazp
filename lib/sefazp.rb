require "sefazp/version"
require "sefazp/cte"
require "rexml/document"

module Sefazp
  extend self

  def parse_cte(xml_content)
    Cte.new(xml_content).parse
  end
end
