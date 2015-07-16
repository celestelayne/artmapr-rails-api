class ArtmaprApiController < ApplicationController

  skip_before_action :verify_authenticity_token, except: [:create, :update, :delete]

  def index

  end

end
