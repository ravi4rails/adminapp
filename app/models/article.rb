class Article < ActiveRecord::Base
  
  def self.search(query)
    where("LOWER(title) LIKE LOWER(?)", "%#{query}%")
  end

end
