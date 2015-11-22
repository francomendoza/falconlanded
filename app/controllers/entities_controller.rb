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

  def show
    @neo = Neography::Rest.new
    query_result = @neo.execute_query("match (n:`#{params[:node_label]}`)-[r*0..1]-(m) where id(n)=#{params[:id]} return n, m, r")

    entity_result = query_result['data'].first.first
    entity_data = entity_result['metadata'].merge(properties: entity_result['data'])
    entity = Entity.new(entity_data)
    related_entities_data = query_result["data"].each_with_object({}) do |result_group, obj|
      _n, m, r = result_group
      next if r.blank?
      relationship_name = r.first['type']
      obj[relationship_name] ||= []
      related_entity_data = Entity.new(m['metadata'].merge(properties: m['data']))
      obj[relationship_name] << related_entity_data
    end.each_with_object([]) do |(relationship_name, array_of_entities), arr|
      arr << ({ relationship: relationship_name, entities: array_of_entities })
    end
    response = {
      entity: entity,
      related_entities: related_entities_data
    }
    respond_to do |format|
      format.json { render json: response }
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
      results = Entity.search_by_label(Array.wrap(params[:node_label]), params[:term])
    elsif params[:match_type] == 'child'
      children_templates = Template.find_by(node_label: params[:node_label]).children_templates
      results = Entity.search_by_label(children_templates, params[:term])
    else
      results = Entity.search(params[:term])
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
