json.reviews do
  json.array! @reviews do |review|
    json.review review
    json.user review.user
    json.book review.book
  end
end
