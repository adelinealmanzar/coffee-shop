class Customer < ActiveRecord::Base
    has_many :orders
    has_many :coffees, through: :orders

    def self.names
        self.all.pluck(:name)
    end

    def order_coffee(coffee_title, price)
        order = Order.create(
            price: price,
            coffee_id: Coffee.find_by(title: coffee_title).id,
            customer_id: self.id
        )
        order.receipt
    end

    def total_purchases_amount
        self.orders.pluck(:price).sum
    end

    def dislike_coffee(coffee_title)
        found_order = self.coffees.find_by(title: coffee_title).orders.last
        found_order.destroy
        puts "#{self.name} has been refunded $#{found_order.price}"
    end
end