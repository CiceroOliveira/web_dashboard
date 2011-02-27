class Wiki
  include Mongoid::Document
  field :uri
  field :name
  field :content
  key :uri
  validates :name, :content, :presence => true
  validates :name, :uniqueness => true
  
  def frontpage?
    self.name == "FrontPage"
  end
  
  def eliminate_spaces(wiki)
    wiki.gsub(/\s/,'_')
  end
  
  def format_local_link
    local_link_regex = /\[\[(\w+([^\]\]])*)\]\]/
    content.gsub!(local_link_regex) {"<a href=\"\\wikis\\#{eliminate_spaces($1)}\">#{$1}</a>"}
  end
end
