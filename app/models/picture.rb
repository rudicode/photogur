class Picture < ActiveRecord::Base
  scope :most_recent, -> { order(created_at: :desc) }
  scope :most_recent_three, -> {most_recent.limit(3) }
  scope :most_recent_five, -> {most_recent.limit(5) }
  scope :created_before, ->(time) {where("created_at < ?", time)}

  # paginates(:per_page => 3)


  @@items_per_page = 3

  def self.items_per_page
    @@items_per_page
  end

  def self.page number
    items_per_page = @@items_per_page
    offset = (items_per_page * number.to_i) - items_per_page
    order(created_at: :desc).limit(items_per_page).offset(offset)
  end 
end
