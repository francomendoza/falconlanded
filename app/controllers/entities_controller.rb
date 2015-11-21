class EntitiesController < ApplicationController
  def create
    entity_form = EntityForm.new(params[:entity])
    new_entity = Entity.new(entity_form.data)
    new_entity.save

    (params[:entity][:related_nodes] || []).each do |related_node|
      related_node[:entity_id].each do |entity_id|
        new_entity.create_rel(entity_id, related_node[:relationship], related_node[:direction])
      end if related_node[:entity_id].present?
    end

    respond_to do |format|
      format.json do
        render json: new_entity.to_hash
      end
    end
  end

  def entities_by_template_id
    node_label = Template.find(params[:template_id]).node_label
    @neo = Neography::Rest.new
    query = @neo.execute_query("match (n:#{node_label}) return n")
    response = query["data"].map do |node|
      node[0]["metadata"].merge(node[0]["data"])
    end 
    respond_to do |format|
      format.json { render json: response }
    end
  end

  def autocomplete
    if params[:match_type] == 'exact'
      results = Entity.search(Array.wrap(params[:node_label]), params[:term])
    elsif params[:match_type] == 'child'
      children_templates = Template.find_by(node_label: params[:node_label]).children_templates
      results = Entity.search(children_templates, params[:term])
    end
    respond_to do |format|
      format.json do
        render json: results.map(&:to_hash)
      end
    end
  end

  def child_templates
    @neo = Neography::Rest.new
    label = @neo.execute_query("match (n) where id(n)=#{params[:entity_id]} return labels(n)")['data'].flatten.first
    results = Template.where({related_nodes: { '$elemMatch' => {template_label: label}}})
    respond_to do |format|
      format.json do
        render json: results.map(&:node_label)
      end
    end
  end
end
