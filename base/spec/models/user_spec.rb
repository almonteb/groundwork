require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do

  before(:each) do
    UserMailer.stub!(:deliver_signup_notification)
  end

  def build_user(attributes={})
    user = User.make_unsaved(attributes)
    user.save
    user
  end

  context "Valid input" do

    it "should be valid" do
      user = build_user
      user.should be_valid
    end

    it "should send confirmation email" do
      UserMailer.should_receive(:deliver_signup_notification)
      user = build_user
      user.should be_valid
    end

  end

  context "Invalid input" do

    it "should require an email" do
      user = build_user(:email => nil)
      user.should have(2).error_on(:email)
    end

    it "should require a login" do
      user = build_user(:login => nil)
      user.should have(2).error_on(:login)
    end

    it "should require password" do
      user = build_user(:password => nil)
      user.should have(2).error_on(:password)
    end

    it "should require password confirmation" do
      user =  build_user(:password_confirmation => nil)
      user.should have(1).error_on(:password_confirmation)
    end

  end

  context "Requesting password reset" do

    before(:each) do
      @user = User.make
      UserMailer.stub!(:deliver_reset_password_instructions)
    end

    it "should reset token" do
      @user.should_receive(:reset_perishable_token!)
      @user.deliver_password_reset!
    end

    it "should send instructions email" do
      UserMailer.should_receive(:deliver_reset_password_instructions).with(@user)
      @user.deliver_password_reset!
    end

  end

  context "Requesting confirmation" do

    before(:each) do
      @user = User.make
    end

    it "should be confirmed" do
      @user.should_receive(:update_attribute).with(:confirmed, true)
      @user.confirm!
    end

    it "should indicate that was recently confirmed" do
      @user.should_receive(:update_attribute).with(:confirmed, true)
      @user.confirm!
      @user.should be_recently_confirmed
    end

  end

end
