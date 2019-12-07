class LbController < ApplicationController
  def health
    render text: 'ok'
  end
end
