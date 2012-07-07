class Admin::MembersController < Admin::AdminController
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end

  def edit
    @member = Member.find(params[:id])
  end

  def create
    @member = Member.new(params[:member])
    if @member.save
      redirect_to admin_members_path
    else
      Rails.logger.info @member.errors.map {|msg| msg.to_s}.join("\n")
      render new_admin_member_path
    end
  end

  def update
    @member = Member.find(params[:id])
    if @member.update_attributes(params[:member])
      redirect_to admin_member_path(@member)
    else
      render edit_admin_member_path
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to admin_members_path
  end
end
