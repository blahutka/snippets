def self.paged_search(query, custom_options = {})
    options = {:per_page => 10}
    options.update(custom_options)

    query_str = []
    query_prms = []

    if options[:from]
      query_str << "created_at > ?"
      query_prms << options[:from]
    end
    
    if options[:locality]
      query_str << "locality_id IN (?)"
      query_prms << options[:locality].is_a?(Array) ? options[:locality] : Locality.find_with_children(options[:locality])
    end

    if options[:category]
      query_str << "categories.id IN (?)"
      query_prms << options[:category].is_a?(Array) ? options[:category] : Category.find_with_children(options[:category])
    end

    conditions = [query_str.join(" AND ")] + query_prms
    search_options = {:conditions => conditions, :include => :categories, :page => options[:page], :per_page => options[:per_page]}

    query.blank? ? Company.paginate(search_options) : Company.search(query, search_options )
  end
