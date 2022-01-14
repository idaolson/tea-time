class SubscriptionSerializer
  include JSONAPI::Serializer

  attributes :title, :price, :status, :frequency, :quantity, :tea_id
end
