class LbController < ApplicationController
  def health
    render html: 'ok'
  end
end
