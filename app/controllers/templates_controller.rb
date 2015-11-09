class TemplatesController < ApplicationController
  
  def show
    template_array = template_collector([], params[:id])
    template_array.uniq!
    respond_to do |format|
      format.json { render json: template_array }
    end
  end

  def templates_by_name
    items = Template.where(node_label: /#{params[:name]}/i).to_a
    respond_to do |format|
      format.json { render json: items }
    end
  end

  def template_collector(templates_array, template_label)
    template = Template.find_by(node_label: template_label)

      templates_array << template

      template.related_nodes.map do |related_node|

        if(related_node[:match_type] != 'exact')

          related_node[:children_templates] = Template.find_by(node_label: related_node[:template_label][0]).children_templates.each do |child_template_label|
            template_collector(templates_array, child_template_label)
          end

        else
          template_collector(templates_array, related_node[:template_label][0])
        end
      end

    templates_array
  end

  def template_params
    params.require(:template).permit(:id)
  end

end
