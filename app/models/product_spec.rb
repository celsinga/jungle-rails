require 'rails_helper'
require "capybara/rails"
require "capybara/rspec"
require "capybara/poltergeist"

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "checks that name isn't missing" do
      @category = Category.create(name: "Vehicle")
      @product = Product.create(price: 33400, quantity: 1, category: @category)
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it "checks that price isn't missing" do
      @category = Category.create(name: "Vehicle")
      @product = Product.create(name: "Mazda", quantity: 2, category: @category)
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end

    it "checks that quanity isn't missing" do
      @category = Category.create(name: "Vehicle")
      @product = Product.create(name: "Audi", price: 53000, category: @category)
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it "checks that category isn't missing" do
      @category = Category.create(name: "Vehicle")
      @product = Product.create(name: "Kia", price: 13000, quantity: 1)
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end
  end
end
Capybara.javascript_driver = :poltergeist