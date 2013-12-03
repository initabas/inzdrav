module ApplicationHelper
	def edit_delete_links(model_type, author, modeltable)
			if current_user == author
				#link_to 'Edit', send("edit_#{model_type.class.to_s.underscore}_path", model_type)		
				destroy = link_to 'Удалить', model_type, method: :delete, data: { confirm: 'Are you sure?' }
				edit = link_to 'Редактировать', edit_polymorphic_path([modeltable, model_type]), remote: true
			  edit + ' ' + destroy
			end
	end
end
