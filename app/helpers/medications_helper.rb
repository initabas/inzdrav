module MedicationsHelper
  def murkup_flagged(model, user, flag)
    mdl = ""
    if user_signed_in?     
      if user.flagged?(model, flag)
        # ln = link_to 'Помогло!', edit_helpful_path
        cl="btn-default" 
        if flag==:helpful
          cl= mdl + "btn-success"
        elsif flag==:nonhelpful
          cl=mdl + "btn-success"
        elsif flag==:callendar  
          cl=mdl + "btn-success"                   
        end
      else
        # ln = link_to 'Помогло', new_helpful_path
        cl=mdl + "btn-default"
      end
    else
      # ln = link_to 'Помогло', new_helpful_path
      cl=mdl + "btn-default"      
    end    
  end
  
  def modal_form(model, flag)
    if user_signed_in?
      if current_user.flagged?(model, flag)
        render  :partial => 'helpfuls/edit',
                :locals =>{:model => model,
                :helpful => Helpful.where("helpfulness_id = ?", model.id).where("helpfulness_type = ?", model.class.name).first}
      else
        render :partial => 'helpfuls/new', :locals => {:model => model, :helpful => Helpful.new}
      end
    else
      "users/sign-in"
    end
  end
  
  def facets_url(search, facet_add, facet_existing)
  	url_for(:search => search, :forma_vypuska_id => facet_add, :ingredient_id => facet_existing)  
  end
  
end
