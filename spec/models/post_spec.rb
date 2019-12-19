# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { FactoryBot.build(:post) }
  it 'タイトルと内容が書かれていれば正常に投稿できること' do
    expect(post).to be_valid
  end
  it 'タイトルが書かれていなくても正常に投稿できること' do
    post.title = nil
    expect(post).to be_valid
  end
  it '内容が書かれていなくても正常に投稿できること' do
    post.description = nil
    expect(post).to be_valid
  end
  it 'タイトルが51字以上だと投稿できないこと' do
    post.title = 'f' * 51
    expect(post).to be_invalid
  end
  it '内容が15001字以上だと投稿できないこと' do
    post.description = 'f' * 15001
    expect(post).to be_invalid
  end
end
