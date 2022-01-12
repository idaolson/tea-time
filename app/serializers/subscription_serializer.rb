class SubscriptionSerializer
  include JSONAPI::Serializer

  attributes :title, :price, :status, :frequency, :quantity, :tea_id

  #change tea id to tea title if you have time
end
