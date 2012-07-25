class MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
    render :layout => false
  end

end
