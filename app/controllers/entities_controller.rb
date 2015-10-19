class EntitiesController < ApplicationController
  def create
    entity_form = EntityForm.new(params[:entity])
    new_entity = Entity.new(entity_form.data)
    new_entity.save
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
    results = Entity.search(params[:type], params[:term])
    respond_to do |format|
      format.json do
        render json: results.map(&:to_hash)
      end
    end
  end
end
