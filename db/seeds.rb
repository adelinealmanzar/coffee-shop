puts "Seeding..."

Customer.delete_all
Coffee.delete_all
Order.delete_all

3.times do
    customer = Customer.create(
        name: Faker::Name.name
    )

    coffee = Coffee.create(
        title: ['machiato', 'americano', 'espresso', 'latte'].sample,
    )

    3.times do 
        order = Order.create(
            price: [2, 3, 4, 5].sample,
            coffee_id: coffee.id,
            customer_id: customer.id
        )   
    end 
end

puts "Done seeding!"