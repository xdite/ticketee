require 'spec_helper'

describe ProjectsController do
  let(:project) { FactoryGirl.create(:project) }

  let(:user) { FactoryGirl.create(:confirmed_user) }

  context "standard users" do
    before do
      sign_in(:user, user)
    end

    it "cannot access the new action" do
      get :new
      response.should redirect_to('/')
      flash[:alert].should == "You must be an admin to do that."
    end
  end

  it "displays an error for a missing project" do
    sign_in(:user, user)
    get :show, :id => "not-here"
    response.should redirect_to(projects_path)
    message = "The project you were looking for could not be found."
    flash[:alert].should == message
  end

  it "cannot access the show action without permission" do
    sign_in(:user, user)
    get :show, :id => project.id
    response.should redirect_to(projects_path)
    flash[:alert].should eql("The project you were looking " + "for could not be found.")
  end

end
