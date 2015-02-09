class Cte
  def initialize(xml_content)
    @xml_content = xml_content
  end

  def parse
    begin
      doc = REXML::Document.new(@xml_content)
      return nil
    rescue
      return nil
    end
  end
end
