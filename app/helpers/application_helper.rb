module ApplicationHelper

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :tables => true, :strikethrough => true, :fenced_code_blocks => true, :no_intra_emphasis => true)
    return markdown.render(text).html_safe
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

  def button_to_with_icon(text, path, classes)
    form_tag path, :method => :get do
      button_tag(classes) do
        raw text
      end
    end
  end


def get_bread_crumb(url)
  begin
    breadcrumb = ''
    sofar = '/'
    elements = url.split('/')
    for i in 1...elements.size
      sofar += elements[i] + '/'
      if i%2 == 0
        begin
         # breadcrumb += "<a href='#{sofar}'>"  + eval("#{elements[i - 1].singularize.camelize}.find(#{elements[i]}).name").to_s + '</a>'
          breadcrumb += "<a href='#{sofar.chomp("/")}'>"  + eval("#{elements[i - 1].singularize.camelize}").to_s + '</a>'

        rescue
          breadcrumb += elements[i]
        end
      else
        breadcrumb += "<a href='#{sofar.chomp("/")}'>#{elements[i].pluralize}</a>"
      end
      breadcrumb += '<span></span>' if i != elements.size - 1
    end
    breadcrumb
  rescue
    'Not available'
  end
end

#  def display_photo(member)  
#    unless member.photo.nil? 
#      image_tag(member.photo.file_name) 
#    else
#      image_tag("/uploads/website_iamges/default_member.png")
#     end    
#  end

end
