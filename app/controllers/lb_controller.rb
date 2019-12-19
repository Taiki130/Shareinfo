class LbController < ApplicationController
  skip_before_action :login_required, only: [:health]
  def health
    render html: 'ok'
  end
end
