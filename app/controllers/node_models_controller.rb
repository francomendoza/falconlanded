class NodeModelsController < ApplicationController

  def grid_search
    # match (a:PARAM), (b:PARAM), (c:PARAM) where id(a) = PARAM, (a)<--(b), (b)<--(c) return a,b,c
    identifiers = ["(a)"]
    letter = "a"
    dictionary = {}
    dictionary[params[:head_node][:node_label]] = "a"
    relationship_map = []
    if params[:relationships]
      params[:relationships].each do |relationship|

        if !dictionary["#{relationship[:node]}"]
          letter = letter.next
          dictionary["#{relationship[:node]}"] = letter
        end

        if !dictionary["#{relationship[:related_to]}"]
          letter = letter.next
          dictionary["#{relationship[:related_to]}"] = letter
        end

        relationship_map << "(#{dictionary[relationship[:related_to]]})--(#{dictionary[relationship[:node]]})"

        identifiers << "(#{letter}:#{relationship[:node]})"
      end
    end

    identifiers = dictionary.map do |label, letter|
      "(#{letter}:`#{label}`)"
    end

    # binding.pry
    queryString = "MATCH #{identifiers.join(',')} where id(a) = #{params[:head_node][:entity_id]} #{relationship_map.empty? ? '' : 'AND'} #{relationship_map.join(' AND ')} return #{dictionary.values.join(',')}"
    puts queryString
    @neo = Neography::Rest.new
    query_result = @neo.execute_query(queryString)

    nodes = query_result["data"][0].map do |node|
      Entity.new(node["metadata"].merge(properties: node["data"]))
    end

    respond_to do |format|
      format.json { render json: nodes }
    end
  end

  def autocomplete
    items = NodeModel.where(label: /#{params[:value]}/i).to_a
    respond_to do |format|
      format.json { render json: items }
    end
  end

  def label
    node = NodeModel.find_by(label: params[:value])
    respond_to do |format|
      format.json { render json: node }
    end
  end

end
