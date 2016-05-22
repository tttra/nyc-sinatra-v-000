class Figure < ActiveRecord::Base
  has_many :landmarks
  has_many :title_figures
  has_many :titles, through: :title_figures

  def slug
    self.name.split(" ").collect do |t|
      t.downcase
    end.join("-")
  end

  def self.find_by_slug(arg)
    Figure.all.find do |t|
      t.slug == arg
    end
  end

end