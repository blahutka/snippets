class Company < ActiveRecord::Base
  named_scope :created_after, lambda { |date| { :conditions => [ 'created_at > ?', date ] } if date }
  named_scope :in_locality, lambda { |location| { :conditions => [ 'locality_id IN (?)', location.is_a?(Array) ? location : Locality.find_with_children(location) ] } }
  named_scope :with_category, lambda { |category| { :include => :categories, :conditions => [ 'categories.id IN ?', category.is_a?(Array) ? category : Category.find_with_children(category) ] } }
  
  def self.paged_search(query, options = {})
    options.reverse_merge!(:per_page => 10)

    operator = created_after(options[:from]).
                in_locality(options[:locality]).
                with_category(options[:category])

    if query.blank?
      operator.paginate(:page => options[:page], :per_page => options[:per_page])
    else
      operator.search(query)
    end
  end
end

