require "sefazp/version"
require "sefazp/mdfe"
require "sefazp/cte"
require "sefazp/nfe"
require "rexml/document"

module Sefazp
  extend self

  def parse_mdfe(xml_content)
    Mdfe.new(xml_content).parse
  end

  def parse_cte(xml_content)
    Cte.new(xml_content).parse
  end

  def parse_nfe(xml_content)
    Nfe.new(xml_content).parse
  end
end
