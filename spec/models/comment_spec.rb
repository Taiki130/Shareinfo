# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { FactoryBot.build(:comment) }
  it 'contentがなければコメントできないこと' do
    comment.content = nil
    expect(comment).to be_invalid
  end
end
