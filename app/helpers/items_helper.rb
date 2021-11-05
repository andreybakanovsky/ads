# frozen_string_literal: true

module ItemsHelper
  def rand_index
    rand(0..(@items.count - 1))
  end

  def ads_index_with_attached
    index = rand_index
    index = rand_index until @items[index].images.attached?
    index
  end
end
