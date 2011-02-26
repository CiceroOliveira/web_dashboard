%section#notice
 = notice

%header
 %h1
  = @wiki.name
  %span#edit-link
   = link_to 'Edit', edit_wiki_path(@wiki), :remote => true, :method => :put

%section#content
 = @wiki.content