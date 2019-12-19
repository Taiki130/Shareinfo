# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '投稿表示機能', type: :system do
  let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
  let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com') }
  let!(:post_a) { FactoryBot.create(:post, title: '最初の投稿', user: user_a) }

  before do
    visit login_path
    fill_in 'session_email', with: 'a@example.com'
    fill_in 'session_password', with: 'password'
    click_button 'ログインする'
  end

  shared_examples_for 'ユーザーAの投稿が表示される' do
    it { expect(page).to have_content '最初の投稿' }
  end

  describe '一覧表示機能' do
    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a }
      before do
        visit posts_path
      end

      it_behaves_like 'ユーザーAの投稿が表示される'
    end

    context 'ユーザーBがログインしているとき' do
      let(:login_user) { user_b }
      before do
        visit posts_path
      end
      it_behaves_like 'ユーザーAの投稿が表示される'
    end
  end

  describe '詳細表示機能' do
    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a }

      before do
        visit post_path(post_a)
      end

      it_behaves_like 'ユーザーAの投稿が表示される'
    end
  end

  describe '新規投稿機能' do
    let(:login_user) { user_a }

    before do
      visit new_post_path
      fill_in 'post_title', with: post_title
      fill_in 'post_description', with: post_description
      click_button '登録する'
    end

    context '新規投稿画面でタイトルを入力したとき' do
      let(:post_title) { '新規投稿のテストを書く' }
      let(:post_description) { '新規投稿の内容' }

      it '正常に登録される' do
        expect(page).to have_selector '.alert-info', text: '投稿が完了しました'
      end
    end

    context '新規投稿画面でタイトルは入力せず、内容は入力したとき' do
      let(:post_title) { '' }
      let(:post_description) { '新規投稿の内容' }

      it 'エラーとなる' do
        expect(page).to have_content 'No Title'
      end
    end
  end
end
