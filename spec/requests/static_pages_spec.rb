require 'spec_helper'


describe "StaticPages" do

  # let(:base_title) { "Ruby on Rails Tutorial Sample App" }
	subject { page }

	shared_examples_for "all static pages" do                # 定义共享用例的辅助方法
		it {should have_content(heading)}
		it {should have_title(full_title(page_title))}
	end

  describe "Home Page" do
		before { visit root_path }
		let(:heading) {'Sample App'}													# let只需要就会用指定的值创建一个局部变量
		let(:page_title) {''}

    it_should_behave_like "all static pages"							# 引用共享用例的辅助方法
		it{should_not have_title('| Home')}
  end

  describe "Help Page" do
		before { visit help_path }														# 只是测试路由

    it{should have_content('Help')}
    it{should have_title(full_title('Help'))}
  end


  describe "About Page" do
		before { visit about_path }

    it{should have_content('About')}
    it{should have_title(full_title('About Us'))}
  end


	describe "Contact page" do

		before { visit contact_path }

    it{should have_content('Contact')}
    it{should have_title(full_title('Contact'))}
	end

	it "should have the right links on the layout" do
		visit root_path
		click_link  "About"
		expect(page).to have_title(full_title('About Us'))
		click_link "Help"
		expect(page).to have_title(full_title('Help'))
		click_link "Contact"
		expect(page).to have_title(full_title('Contact'))
		click_link "Home"
		click_link "Sign up now!"
		expect(page).to have_title(full_title('Sign up'))
		click_link "sample app"
		expect(page).to have_title(full_title(''))
	end

end
