# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "User", type: :model do
  describe '#create' do
    it "名前を入力しなかったとき" do
      user = User.new(name: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
    it "メールアドレスを入力しなかったとき" do
      user = User.new(name: "john", email: "", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "パスワードを入力しなかったとき" do
      user = User.new(name: "john", email: "kkk@gmail.com", password: "", password_confirmation: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
  end
end
