class Paginator
  attr_reader :per_page

  def initialize(collection, per_page: 25)
    @collection = collection
    @per_page = per_page
  end

  def page(page)
    offset = (page || 0) * per_page
    @collection.limit(per_page).offset(offset)
  end
end
