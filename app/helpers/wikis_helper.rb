module WikisHelper
  
  def formatted_content(content)
    local_link_regex = /\[\[(\w+([^\]\]])*)\]\]/
    content.gsub!(local_link_regex) {"<a href=\"\\wikis\\#{eliminate_spaces($1)}\">#{$1}</a>"}
    textilize(content)
  end
  
  def eliminate_spaces(wiki)
    wiki.gsub(/\s/,'_')
  end
  
end
