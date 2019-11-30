# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { 'テストを書く' }
    description { 'RSpec&Capybara&FactoryBotを準備する' }
    user
  end
end
