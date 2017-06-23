FactoryGirl.define do
  factory :user do
    username 'kelly'
    password 'password'

    factory :wrong_user do
      username 'terrence'
      password 'password1'
    end
    
  end


end
