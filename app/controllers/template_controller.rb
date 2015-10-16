class TemplateController < ApplicationController
  
  def show
    template_array = template_collector([], params[:id])
    respond_to do |format|
      format.json { render json: template_array }
    end
  end

  def templatesbyname
    items = Template.where(node_label: /#{params[:name]}/i).to_a
    respond_to do |format|
      format.json { render json: items }
    end
  end

  def template_collector(templates_array, template_id)
    template = Template.find(template_id)
    templates_array << template
    template.related_nodes.each do |related_node|
      template_collector(templates_array, related_node[:template_id])
    end
    templates_array
  end

  def template_params
    params.require(:template).permit(:id)
  end

end
