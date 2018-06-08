FactoryGirl.define do

  factory :captured_image do
    content File.open("#{Rails.root}/app/assets/images/header_bg.png")
    status 0
  end

end
